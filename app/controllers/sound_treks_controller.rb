class SoundTreksController < ApplicationController
  include SoundTreksHelper

  def index
    if request.xhr? && logged_in?
      @nearby_sound_treks = SoundTrek.near([params[:lat], params[:lng]], 0.5, :units => :km)
      render json: @nearby_sound_treks
    end
  end

  def show
    if request.xhr?
      RSpotify.authenticate(ENV['spotify_id'], ENV['spotify_secret'])
      sound_trek = SoundTrek.find_by(:id => params[:soundtrekId].to_i)
      creator = sound_trek.trekker
      playlist = RSpotify::Playlist.find(creator.spotify_id, sound_trek.playlist)
      base_url = "https://embed.spotify.com/?uri=spotify:user:#{creator.spotify_id}:playlist:#{playlist.id}"
      respond_to do |format|
        format.json { render layout: false, json: {:base_url => base_url, :sound_trek_id => sound_trek.id }}
      end
    else
      if logged_in?
        matched_playlist = Array.new
        @rating = Rating.new
        @sound_trek = SoundTrek.find(params[:id])
        RSpotify.authenticate(ENV['spotify_id'], ENV['spotify_secret'])
        user = User.find_by(:id => session[:user_id])
        spotify_user = RSpotify::User.find(user.spotify_id)
        @creator = @sound_trek.trekker
        @playlist = RSpotify::Playlist.find(@creator.spotify_id, @sound_trek.playlist)
        base_url = "https://embed.spotify.com/?uri=spotify:user:#{@creator.spotify_id}:playlist:#{@playlist.id}"
        @sound_trek
      else
        flash[:no_show_access] = "You must be logged in to view SoundTreks."
        redirect_to "/"
      end
    end
  end

  def new
    @playlists = Array.new
    RSpotify.authenticate(ENV['spotify_id'], ENV['spotify_secret'])
    user = User.find_by(:id => session[:user_id])
    spotify_user = RSpotify::User.find(user.spotify_id)
    spotify_user.playlists.each do |playlist|
      if playlist.uri.match(/\b#{user.spotify_id}\b/) != nil
        @playlists << playlist
      end
    end
    @playlists
    @sound_trek = SoundTrek.new
    if request.xhr?
      render 'sound_treks/_new', layout: false
    end
  end

  def edit
    @playlists = Array.new
    RSpotify.authenticate(ENV['spotify_id'], ENV['spotify_secret'])
    user = User.find_by(:id => session[:user_id])
    spotify_user = RSpotify::User.find(user.spotify_id)
    spotify_user.playlists.each do |playlist|
    if playlist.uri.match(/\b#{user.spotify_id}\b/) != nil
        @playlists << playlist
      end
    end
    @sound_trek = SoundTrek.find(params[:id])
    if sound_trek_owner?(@sound_trek)
      @sound_trek
    else
      flash[:no_access_edit] = "You do not have permission to edit this SoundTrek."
      redirect_to @sound_trek
    end
  end

  def create
    if logged_in?
      if request.xhr?
        @sound_trek = SoundTrek.new(sound_trek_params)
        if @sound_trek.save
          render json: @sound_trek.id
        else
          render status 422
        end
      end
    else
      flash[:no_access_create] = "You must be logged in to create a SoundTrek."
      redirect_to "/"
    end
  end

  def update
    @sound_trek = SoundTrek.find(params[:id])
    if @sound_trek.update(sound_trek_params)
      redirect_to @sound_trek
    else
      render "edit"
    end
  end

  def destroy
    @sound_trek = SoundTrek.find(params[:id])

    if sound_trek_owner?(@sound_trek)
      @sound_trek.destroy
      redirect_to user_path(session[:user_id])
    else
      flash[:no_access] = "You do not have permission to delete this SoundTrek."
      redirect_to @sound_trek
    end
  end

  private

  def sound_trek_params
    params.require(:sound_trek).permit(:title, :description, :playlist, :trekker_id, :latitude, :longitude)
  end
end
