module RatingsHelper
  def already_rated?(sound_trek)
    !!sound_trek.ratings.find_by(trekker_id: session[:user_id])
  end
end


