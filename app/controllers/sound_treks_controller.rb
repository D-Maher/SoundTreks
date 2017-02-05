class SoundTreksController < ApplicationController
  def index
  end

  def new
    @sound_trek = SoundTrek.new
  end

  def create
    @sound_trek = SoundTrek.new(sound_trek_params)
    if @sound_trek.save
      redirect_to @sound_trek
    else
      @errors = @sound_trek.errors.full_messages
      render "new"
    end
  end

  def show
  end

  private
  def sound_trek_params
    params.require(:sound_trek).permit(:description, :location_id, :playlist_id)
  end
end
