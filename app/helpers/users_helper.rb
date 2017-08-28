module UsersHelper
	def authenticated?
		redirect_to login_url if current_user.nil?
	end

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def require_user
		authenticated?
	end
end
