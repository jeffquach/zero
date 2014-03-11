class ReviewsController < ApplicationController
	before_filter :require_login
	before_action :find_user
	before_action :find_review, only: [:edit,:update,:destroy]
	
	def new
		@review = Review.new
	end

	def create
		@review = @user.reviews.build(review_params)
		@review.user_id = @user.id
		@review.review_writer_id = current_user.id
		respond_to do |format|
			if @review.save
				format.html {redirect_to @user, success: "You created a new review!"}
				format.js
			else
				render :new
			end
		end
	end

	def edit
	end

	def update
		if @review.update_attributes(review_params)
			flash[:alert] = "You updated a review!"
			redirect_to @user
		end
	end

	def destroy
		respond_to do |format|
			if @review.destroy
				format.html {redirect_to @user, alert: "You deleted a review!"}
				format.js
			end
		end
	end

	private
	def review_params
		params.require(:review).permit(:content,:user_id,:review_writer_id)
	end

	def find_user
		@user = User.find(params[:user_id])
	end

	def find_review
		@review = Review.find(params[:id])
	end
end