class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:index,:new,:create,:activate]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		auto_login @user
  		flash[:success] = "Thank you for signing up!"
  		redirect_to users_path
  	else
  		render :new
  	end
  end

  def index
  	@users = User.all
  end

  private
  def user_params
  	params.require(:user).permit(:email,:password,:password_confirmation)
  end
end
