class MeetupsController < ApplicationController
	before_filter :require_login
	before_action :find_user

	def new
		@meetup = @user.meetups.build
	end

	def create
		
	end

	private
	def meetup_params
		params.require(:meetup).permit(:studying,:description,:start_time,:end_time,:number_of_people)
	end
	
	def find_user
		@user = User.find(params[:user_id])
	end
end