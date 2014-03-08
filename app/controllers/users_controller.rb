class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:index,:new,:create,:activate]
  before_filter :require_login, only: [:edit,:update,:destroy]
  before_action :find_user, only: [:show,:edit,:update,:destroy,:infowindow]
  before_filter :admin_user, only: :destroy

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Thank you for signing up! A confirmation email has been sent to your inbox"
  		redirect_to users_path
  	else
  		render :new
  	end
  end

  def index
    if params[:search] && params[:search][:city_search] && params[:search][:learning_search]
      @users = User.near(params[:search][:city_search],100).where("learning ILIKE ?",params[:search][:learning_search])
    else
      redirect_to root_url
    end
  end

  def home
    
  end

  def show
    @nearbys = @user.nearbys(10, units: :km).where("learning ILIKE ?", @user.learning)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = "You have updated your user information"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path, alert: "You deleted a user!"
    end
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(login_path, :notice => 'User was successfully activated.')
    else
      not_authenticated
    end
  end

  def infowindow
    respond_to do |format|
      format.html {render partial: "infowindow", locals: {user: @user}}
    end
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :address, :city, :state_province, :image, :country,:learning,admin: false,)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
