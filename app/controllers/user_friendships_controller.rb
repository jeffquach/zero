class UserFriendshipsController < ApplicationController
	before_filter :require_login
	
	def index
		@user_friendships = current_user.user_friendships
	end

	def update
		@user_friendship = current_user.user_friendships.find(params[:id])
		if @user_friendship.accept!
			respond_to do |format|
				format.html {redirect_to user_friendships_path}
				format.js
			end
		end
	end

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
			@user_friendship = UserFriendship.request(current_user, @friend)

				respond_to do |format|
					if @user_friendship.new_record?
						format.html do
							flash[:error] = "There was a problem creating that friend request." 
							redirect_to user_path(@friend)
						end
						format.json {render json: @user_friendship.to_json}
						
					else		
						format.html do
							flash[:success] = "Friend request sent"
							redirect_to user_path(@friend)
						end
						format.json {render json: @user_friendship.to_json}
					end
				end	
				

	   	else
			flash[:error] = "Friend required"
			redirect_to root_path
		end
	end

	def edit
		@user_friendship = current_user.user_friendships.find(params[:id])
		@friend = @user_friendship.friend
	end

	def destroy
	   @user_friendship = current_user.user_friendships.find(params[:id])
		if @user_friendship.destroy
			respond_to do |format|
				format.json {render json: @user_friendship.to_json}
				format.html {redirect_to user_friendships_path, notice: "You have deleted a study partner!"}
			end
		end
	end
end