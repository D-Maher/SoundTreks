class LocationsController < ApplicationController

  def index
    @locations = Location.near([params[:lat], params[:lng]], 0.5, :units => :km)
    render json: @locations
  end

  def create
    if logged_in?
      @playlists = Array.new
      RSpotify.authenticate(ENV['spotify_id'], ENV['spotify_secret'])
      user = User.find_by(:id => session[:user_id])
      spotify_user = RSpotify::User.find(user.spotify_id)
      spotify_user.playlists.each do |playlist|
        if playlist.uri.match((/\b#{user.spotify_id}\b/)) != nil
          @playlists.push(playlist)
        end
      end
      @location = Location.new(location_params)
      if request.xhr?
        @sound_trek = SoundTrek.new
        if @location.save
          render "/sound_treks/new", layout: false
        else
          status 422
        end
      end
    else
      status 401
    end
  end

  private

  def location_params
    params.require(:location).permit(:latitude, :longitude)
  end
end

