class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    if request.xhr?
      render 'users/_edit', layout: false
    end
  end

  def update
    p params[:name]
    if request.xhr?
      user = User.find_by(:id => session[:user_id])
      user.update_attributes(:nick_name => params[:name])
      p user
      respond_to do |format|
        format.json { render layout: false, json: {:name => user.nick_name }}
      end
    end
  end

end
