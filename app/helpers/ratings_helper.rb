module RatingsHelper
  def rated_by_current_user?(sound_trek)
    !!sound_trek.ratings.find_by(trekker_id: session[:user_id])
  end
end


