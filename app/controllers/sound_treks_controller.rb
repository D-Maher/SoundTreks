class SoundTreksController < ApplicationController
  def index
  end

  def show
    @sound_trek = SoundTrek.find(params[:id])
  end

  def new
    @sound_trek = SoundTrek.new
  end

  def edit
    # add helper method for seeing if a user is owner
    # @sound_trek = SoundTrek.find(params[:id])
    # if sound_trek_owner?(@sound_trek)

    # else
    #   render file: 'public/404.html'
    # end
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

  def update
    @sound_trek = SoundTrek.find(params[:id])
     if @sound_trek.update(sound_trek_params)
      redirect_to @sound_trek
    else
      render 'edit'
    end
  end


  # def destroy
  # end


  private
  def sound_trek_params
    params.require(:sound_trek).permit(:description, :title, :location_id, :playlist_id)
  end
end
