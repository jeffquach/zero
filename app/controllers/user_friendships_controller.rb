class UserFriendshipsController < ApplicationController
	before_filter :require_login, only: [:new]
	
	def new
		if params[:friend_id]
			@friend = User.find(params[:friend_id])
			@user_friendship = current_user.user_friendships.new(friend: @friend)
		else
			flash[:error] = "Friend required"
		end

	rescue ActiveRecord::RecordNotFound
		render file: 'public/404', status: :not_found
	end

	def create
		if params[:user_friendship] && params[:user_friendship].has_key?(:friend_id)
		@friend = User.find(params[:user_friendship][:friend_id]) 		
		@user_friendship = current_user.user_friendships.new(friend: @friend)
			if @user_friendship.save
			flash[:success] = "You are now friends with #{@friend.first_name}"
			redirect_to user_path(@friend)				

		else
			flash[:error] = "Friend required"
			redirect_to root_path
		end
	end
end
end