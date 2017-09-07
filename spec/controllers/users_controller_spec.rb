require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before do
    @user_params = { :user => { :username => 'test', :password => 'test_pass', :password_confirmation => 'test_pass' } }

    session[:user_id] = nil
  end

  describe "GET #new" do
    it "returns http success with nil session" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "redirects user to login if account already exists" do
      @user_params[:user][:username] = 'noah'
      post :create, @user_params

      expect(response).to redirect_to login_url
    end

    it "redirects to dashboard if session exists" do
      session[:user_id] = 1

      post :create, @user_params

      expect(response).to redirect_to dashboard_url
    end

  	it "creates user correctly" do
  		post :create, @user_params

      expect(session[:user_id]).not_to be_nil
      expect(session[:user_id]).to be_present
  		expect(response).to redirect_to dashboard_url
  	end

  	it "creates user with wrong password confirmation" do
      @user_params[:user][:password_confirmation] = 'blahhh'

  		post :create, @user_params
  		expect(response).to redirect_to signup_url
  		expect(flash[:notice]).to be_present
  	end
  end
end
