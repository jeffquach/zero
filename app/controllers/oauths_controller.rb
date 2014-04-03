class OauthsController < ApplicationController
	skip_before_filter :require_login

	def oauth
		login_at(auth_params[:provider])
	end

	def callback
		provider = auth_params[:provider]

		if @user = login_from(provider)
		  redirect_to user_path(@user), :info => "Logged in from #{provider.titleize}!"
		else
		  begin
		    @user = create_from(provider)
		    # NOTE: this is the place to add '@user.activate!' if you are using user_activation submodule
		    @user.activate!
		    reset_session # protect from session fixation attack
		    auto_login(@user)
		    redirect_to edit_user_path(@user), :info => "Logged in from #{provider.titleize}!"
		  rescue
		    redirect_to root_path, :danger => "Failed to login from #{provider.titleize}!"
		  end
		end
	end

	private
	def auth_params
		params.permit(:provider, :code, :user_id, :uid)
		# params.permit(:user_id, :provider, :uid)
	end
end
