require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

	before do
		@user_params = { :username => 'noah', :password => 'blah123' }
	end

	describe "GET #new" do
	it "returns http success" do
	  get :new
	  expect(response).to have_http_status(:success)
	end
	end

	describe "POST #create" do
		it "logs user in successfully" do
			post :create, @user_params

			expect(session[:user_id]).not_to be_nil
			expect(session[:user_id]).to be_present

			expect(response).to redirect_to dashboard_url
		end

		it "redirects to login when username and password aren't present" do
			post :create

			expect(response).to redirect_to login_url
		end
	end
end
