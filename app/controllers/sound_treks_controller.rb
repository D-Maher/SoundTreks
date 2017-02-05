class SoundTreksController < ApplicationController
  def index
  end

  def new
    @sound_trek = SoundTrek.new(sound_trek_params)
  end

  def create
    if request.xhr?
      if @sound_trek.save
        redirect_to location_sound_trek_path(@location, @sound_trek)
      else
        status 422
      end
    end
  end

  private
  def sound_trek_params
    params.require(:sound_trek).permit(:description, :location_id, :playlist_id)
  end
end
