class MeetupsController < ApplicationController
	before_filter :require_login

	def new
		
	end

	private
	def meetup_params
		params.require(:meetup).permit(:studying,:description,:start_time,:end_time,:number_of_people)
	end
	
end