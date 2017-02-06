class RatingsController < ApplicationController
  include RatingsHelper

  def create
    @sound_trek = SoundTrek.find_by(id: params[:sound_trek_id])

    if !already_rated?(@sound_trek)
      @rating = @sound_trek.ratings.new(rating_params)
      @rating.update_attributes(sound_trek_id: params[:sound_trek_id], trekker_id: session[:user_id])
      if @rating.save
        flash[:rating_notice] = "Your rating has been recorded."
        redirect_to sound_trek_path(@sound_trek)
      else
       render file: 'public/404.html'
      end
    else
      flash[:already_rated] = "You have already rated this SoundTrek."
      redirect_to sound_trek_path(@sound_trek)
    end
  end

  def update
  end

  private

  def rating_params
    params.require(:rating).permit(:stars)
  end
end

