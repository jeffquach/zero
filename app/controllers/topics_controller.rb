class TopicsController < ApplicationController
	before_filter :require_login
	before_action :find_topic, only: [:edit,:update,:destroy]

	def new
		@topic = Topic.new
		@topic.build_subject
	end

	def create
		@topic = Topic.new(topic_params)
		@topic.user_id = current_user.id
		@topic.subject_id = params[:subject][:id]
		if @topic.save
			flash[:success] = "Success!"
			render :new
		else
			flash[:error] = "Error!"
			render :new
		end
	end


	def edit	
	end

	def update
		if @topic.update_attributes(topic_params)
			flash[:success] = "You have updated your learning information"
			render :edit
		else
			render :edit
		end
	end

	def destroy
		if @topic.destroy
			flash[:alert] = "You deleted a topic!"
			redirect_to @user
		end
	end

	private
	def topic_params
		params.require(:topic).permit(:name,:subject_id,:user_id, :experience,  subjects_attributes: [:name])
	end

	def find_topic
		@topic = Topic.find(params[:id])
	end
end