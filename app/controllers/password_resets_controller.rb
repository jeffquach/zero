class PasswordResetsController < ApplicationController
	skip_before_filter :require_login

  def create
  	@user = User.find_by_email(params[:email])
  	@user.deliver_reset_password_instructions! if @user
  	redirect_to root_path, notice: "Password reset instructions have been sent to your email"
  end

  def edit
  	@user = User.load_from_reset_password_token(params[:id])
  	@token = params[:id]
  	if @user.blank?
  		not_authenticated
  		return
  	end
  end

  def update
  	@token = params[:token]
  	@user = User.load_from_reset_password_token(params[:token])
  	if @user.blank?
  		not_authenticated
  		return
  	end
  	@user.password_confirmation = params[:user][:password_confirmation]
  	if @user.change_password!(params[:user][:password])
  		redirect_to root_path, notice: "Your password was successfully updated"
  	else
  		render :edit
  	end
  end
end
