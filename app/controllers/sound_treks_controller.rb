class SoundTreksController < ApplicationController
  include SoundTreksHelper

  def index
  end

  def show
    if logged_in?
      @rating = Rating.new
      @sound_trek = SoundTrek.find(params[:id])
    else
      flash[:no_show_access] = "You must be logged in to view SoundTreks."
      redirect_to "/"
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
    if logged_in?
      @sound_trek = SoundTrek.new(sound_trek_params)
      if @sound_trek.save
        redirect_to @sound_trek
      else
        @errors = @sound_trek.errors.full_messages
        render "new"
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
    params.require(:sound_trek).permit(:description, :title, :location_id, :playlist, :trekker_id)
  end
end
