class LocationsController < ApplicationController

  def index
  end

  def create
    RSpotify.authenticate(ENV['spotify_id'], ENV['spotify_secret'])
    user = User.find_by(:id => session[:user_id])
    spotify_user = RSpotify::User.find(user.spotify_id)
    @playlists = spotify_user.playlists

    @location = Location.new(location_params)
    if request.xhr?
      @sound_trek = SoundTrek.new
      if @location.save
        p "INSIDE LOCATIONS CONTROLLER, PLAYLISTS:"
        p @playlists
        render "/sound_treks/new", layout: false
        # redirect_to new_location_sound_trek_path(@location)
      else
        status 422
      end
    end
  end

  private

  def location_params
    params.require(:location).permit(:latitude, :longitude)
  end
end

