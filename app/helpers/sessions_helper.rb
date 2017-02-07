module SessionsHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    session[:user_id] != nil
  end

  def sound_trek_creator?
    session[:user_id] == @sound_trek.trekker_id
  end
end
