class DashboardController < ApplicationController
	include UsersHelper

	before_action :require_user

	def index
	end
end
