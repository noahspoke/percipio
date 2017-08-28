require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
  	it "creates user correctly" do
  		post :create, :user => { :username => 'test', :password => 'test_pass', :password_confirmation => 'test_pass' }
  		expect(response).to redirect_to dashboard_url
  	end

  	it "creates user with wrong password confirmation" do
  		post :create, :user => { :username => 'test', :password => 'test_pass', :password_confirmation => 'blahhh' }
  		expect(response).to redirect_to signup_url
  		expect(flash[:notice]).to be_present
  	end
  end
end
