require 'rails_helper'

RSpec.describe NotesController, type: :controller do

	before do
		@user = User.create(username: 'blah', password: 'test')
		session[:user_id] = @user.id
	end

	describe "GET #new" do
	it "returns http success" do
	  get :new
	  expect(response).to have_http_status(:success)
	end
	end

	describe "POST #create" do
		it "returns a created note" do
			post :create, :note => { :name => 'test', :user_id => @user.id, :url => 'http://test.com/blah' }
			expect(response).to redirect_to dashboard_url
		end

		it "note missing required param" do
			request.env['HTTP_REFERER'] = 'http://test.com'
			post :create, :note => { :name => 'test', :user_id => @user.id }
			expect(response).to redirect_to :back
			expect(flash[:notice]).to be_present
		end
	end

end
