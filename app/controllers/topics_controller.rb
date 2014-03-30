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
			respond_to do |format|
				format.js
				format.html {redirect_to new_topic_path}
			end
		else
			respond_to do |format|
				format.html {render :new, error: "There was an error saving your data"}
			end
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
		if @edit_topic.destroy
			respond_to do |format|
				format.html {redirect_to new_topic_path}
				format.js {redirect_to new_topic_path, alert: "You deleted a topic!"}
			end
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