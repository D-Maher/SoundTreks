class SoundTreksController < ApplicationController
  include SoundTreksHelper

  def index
  end

  def show
    RSpotify.authenticate(ENV['spotify_id'], ENV['spotify_secret'])
    user = User.find_by(:id => session[:user_id])
    spotify_user = RSpotify::User.find(user.spotify_id)
    sound_trek = SoundTrek.find_by(:id => params[:soundtrekId].to_i)
    playlist = RSpotify::Playlist.find(user.spotify_id, sound_trek.playlist)
    base_url = "https://embed.spotify.com/?uri=spotify:user:#{user.spotify_id}:playlist:#{playlist.id}"
    respond_to do |format|
      format.json { render layout: false, json: {:base_url => base_url }}
    end
  end

  def edit
    @sound_trek = SoundTrek.find(params[:id])
    if sound_trek_owner?(@sound_trek)
      @sound_trek
    else
      flash[:no_access_edit] = "You do not have permission to edit this SoundTrek."
      redirect_to @sound_trek
    end
  end

  def create
  @sound_trek = SoundTrek.new(sound_trek_params)
    if @sound_trek.save
      p "NICE!"
      redirect_to @sound_trek
    else
      @errors = @sound_trek.errors.full_messages
      render "new"
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
    params.require(:sound_trek).permit(:description, :title, :location_id, :playlist, :trekker_id)
  end
end
