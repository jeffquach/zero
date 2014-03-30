class SubjectsController < ApplicationController
	before_filter :require_login

	def new
		@subject = current_user.subjects.build
		@topic = @subject.topics.build
	end

	def create
		@subject = current_user.subjects.build(subject_params)
		if @subject.save && @topic.save
			flash[:success] = "New subject created!"
			redirect_to user_path(current_user)
		else
			flash[:error] = "Errors!!!"
			render :new
		end
	end

	def destroy
		@subject = Subject.find(params[:id])
		if @subject.destroy
			respond_to do |format|
				format.html {redirect_to new_topic_path}
				format.js {redirect_to new_topic_path, alert: "You deleted a subject"}
			end
		end
	end

	private
	def subject_params
		params.require(:subject).permit(:name, topics_attributes: [:id,:name,:user_id,:subject_id])
	end
	
end