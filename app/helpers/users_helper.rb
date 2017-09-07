module UsersHelper
	def authenticated?
		redirect_to login_url if session[:user_id].nil?
	end

	def current_user
		@current_user ||= User.find(session[:user_id]) unless session[:user_id].nil?
	end

	def require_user
		authenticated?
	end
end
