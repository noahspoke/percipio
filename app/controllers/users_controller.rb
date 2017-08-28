class UsersController < ApplicationController
  def new
  end

  def create
  	redirect_to signup_url and return unless params[:user]

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
