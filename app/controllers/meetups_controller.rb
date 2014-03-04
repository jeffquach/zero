class MeetupsController < ApplicationController
	before_filter :require_login
	before_action :find_meetup, only: [:edit,:show,:update,:destroy]

	def new
		@meetup = current_user.meetups.build
	end

	def create
		@meetup = current_user.meetups.build(meetup_params)
		@meetup.user = current_user
		if @meetup.save
			flash[:success] = "You successfully created an event!"
			redirect_to @meetup
		else
			render :new
		end
	end

	def index
		@meetup = Meetup.all
	end

	def edit
	end

	def update
		if @meetup.update_attributes(meetup_params)
			flash[:notice] = "You have successfully updated your meetup"
			redirect_to meetup_path(@meetup)
		else
			render :edit
		end
	end

	def show
	end

	def destroy
		if @meetup.destroy
			flash[:alert] = "You deleted your meetup!"
			redirect_to root_url
		end
	end

	private
	def meetup_params
		params.require(:meetup).permit(:studying,:description,:start_time,:end_time,:number_of_people)
	end

	def find_meetup
		@meetup = Meetup.find(params[:id])
	end
	
end