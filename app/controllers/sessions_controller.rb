class SessionsController < ApplicationController
include SessionsHelper

  def create
    p "=" * 40
    p "Im In CREATE!"
    auth = request.env["omniauth.auth"]
    session[:omniauth] = auth
    p session['omniauth.state']
    user = User.sign_in_from_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, notice: "SIGNED IN"
  end

  def destroy
    session[:user_id] = nil
    session[:omniauth] = nil
    redirect_to root_url, notice: "SIGNED OUT"
  end

end
