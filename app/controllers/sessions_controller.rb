class SessionsController < ApplicationController
  def new
  end

  def create
  	redirect_to login_url and return unless params[:username] && params[:password]

  	if user = User.find_by(username: params[:username])
  		if user.authenticate(params[:password])
  			session[:user_id] = user.id
  		end
  	end

  	redirect_to dashboard_url and return unless session[:user_id].nil?
  end
end
