class CommentsController < ApplicationController
	before_filter :require_login
	before_action :find_meetup
	before_action :find_comment, only: [:edit,:destroy,:update]
	
	def create
		@comment = @meetup.comments.build(comment_params)
		@comment.user = current_user
		@comment.user_id = current_user.id

		respond_to do |format|
			if @comment.save
				format.html {redirect_to meetup_path(@meetup), success: "A new comment was created!"}
				format.js 
			else
				format.html {redirect_to meetup_path(@meetup), danger: "There was an error in your comment"}
			end
		end
	end

	def edit	
	end

	def update
		if @comment.update_attributes(comment_params)
			flash[:info] = "You've updated your comment!"
			redirect_to meetup_path(@meetup)
		end
	end

	def destroy
		respond_to do |format|
			if @comment.destroy
				format.js
			end
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:content,:user_id,:meetup_id)
	end

	def find_meetup
		@meetup = Meetup.find(params[:meetup_id])
	end

	def find_comment
		@comment = Comment.find(params[:id])
	end
end