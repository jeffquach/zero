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
			redirect_to edit_topic_path(current_user)
		else
			flash[:error] = "Error!"
			render :new
		end
	end


	def edit
		@topic = Topic.new
		@subjects = current_user.subjects.map(&:topics)
		@topic.build_subject
	end

	def update
		@user = User.find(params[:id])
		if @edit_topic.update_attributes(topic_params)
			respond_to do |format|
				format.html {render :edit}
				format.js {render :edit, success: "You have updated your learning information"}
			end
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
		params.require(:topic).permit(:name,:subject_id,:user_id, :experience,  subject_attributes: [:name])
	end

	def find_topic
		@edit_topic = Topic.find(params[:id])
	end
end