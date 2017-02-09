class SessionsController < ApplicationController
include SessionsHelper

  def create
    auth = request.env["omniauth.auth"]
    session[:omniauth] = auth
    user = User.sign_in_from_omniauth(auth)
    session[:user_id] = user.id
    redirect_to "/sound_treks", notice: "SIGNED IN"
  end

  def destroy
    session[:user_id] = nil
    session[:omniauth] = nil
    redirect_to users_path, notice: "SIGNED OUT"
  end

end
