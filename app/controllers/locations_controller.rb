class LocationsController < ApplicationController

  def index
  end

  def create
    @location = Location.new(location_params)
    if request.xhr?
      if @location.save
        redirect_to new_location_sound_trek_path(@location)
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

