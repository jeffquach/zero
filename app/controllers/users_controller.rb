class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:index,:new,:create,:activate]
  before_filter :require_login, only: [:edit,:update,:destroy]
  before_action :find_user, only: [:show,:edit,:update,:destroy,:infowindow,:edit_meetup_info,:tooltip]
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
    if params[:city_search].blank? || params[:subject_search].blank? || params[:topic_search].blank?
      flash[:alert] = "The search field cannot be blank!"
      redirect_to root_url and return
    elsif params[:city_search] && params[:subject_search] && params[:topic_search]
      @users = User.near(params[:city_search],100).includes(:subjects).where("subjects.id = ?", params[:subject_search]).references(:subjects).joins(:topics).where('topics.name = ?', params[:topic_search])
      Rails.logger.info "TELL me what this is #{@users.inspect}"
      if @users.empty?
        flash[:alert] = "No users found"
        redirect_to root_url and return
      end
    else
      redirect_to root_url
    end
  end

  def home
  end

  def show
    @nearbys = @user.nearbys(10, units: :km).joins(:topics).where("name ILIKE ?", @user.topics.first.name)

    @friends = @user.friends
    @review = Review.new(user_id: @user.id)

    # @review = @user.reviews.build

  end

  def edit
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

  def tooltip
    respond_to do |format|
      format.html {render partial: "tooltip"}
    end
  end

  def edit_meetup_info   
  end

  private
  
  def user_params
     params.require(:user).permit(:first_name, :last_name, :bio, :email, :password, :password_confirmation, :address, :city, :state_province, :image, :country, :currently_available, :study_location_available, :current_online_learning, :education, :languages, :skills, :preferred_gender, :smoking_allowed, :can_host_children, :can_host_pets, :has_pets)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
