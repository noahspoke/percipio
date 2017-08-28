class NotesController < ApplicationController
	include UsersHelper
	before_action :require_user

	def new
	end

	def create
		note = Note.create(note_params)

		redirect_to :back and return unless note.save
		redirect_to dashboard_url, :alert => "Success! Your note was saved!" and return
	
	rescue
		redirect_to :back, :notice => "Your're missing some necessary information." and return
	end

	private

	def note_params
		params.require(:note).permit(:name, :user_id, :url)
	end
end
