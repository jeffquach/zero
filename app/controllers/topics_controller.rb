class TopicsController < ApplicationController
	before_filter :require_login

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

	private
	def topic_params
		params.require(:topic).permit(:name,:subject_id,:user_id, subjects_attributes: [:name])
	end
end