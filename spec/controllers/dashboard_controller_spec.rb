require 'rails_helper'

RSpec.describe DashboardController, :type => :controller do
	describe "GET #index" do
		it "does not load with nil session" do
			session[:user_id] = nil
			get :index
			expect(response).to have_http_status(302)
			expect(response).to redirect_to login_url
		end

		it "loads main page with session present" do
			session[:user_id] = 1
			get :index

			expect(response).to have_http_status(:success)
		end
	end
end