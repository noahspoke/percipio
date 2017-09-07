class UsersController < ApplicationController
  #protect_from_forgery prepend: true

  def new
  end

  def create
  	redirect_to signup_url and return unless params[:user]

    redirect_to login_url, :notice => "An account with this username already exists." and return if User.find_by(username: user_params[:username])

  	user = User.create(user_params)

  	redirect_to signup_url, :notice => "Your passwords don't match." and return unless user.save

  	current_user = user
  	session[:user_id] = user.id

  	redirect_to dashboard_url and return
  end

  private

  def user_params
  	params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
