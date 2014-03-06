class InviteesController < ApplicationController
	before_action :require_login
	before_action :find_invitee, only: [:edit,:update]

	def edit
	end

	def update
		if @invitee.update_attribute("response", status)
			respond_to do |format|
				format.js 
			end
		else
			render :edit
		end
	end

	def status
		change = params[:commit]
		if change == "Attend"
			"yes"
		elsif change == "Maybe"
			"maybe"
		elsif change == "Decline"
			"no"
		end
	end

	private
	def find_invitee
		@invitee = Invitee.find(params[:id])
	end

end