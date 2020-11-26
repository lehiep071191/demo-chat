class UsersController < ApplicationController
  before_action :logged_in_user,  only: [:show, :index, :edit, :update, :destroy]
  before_action :set_user, only: [:edit,:update,:correct_user]
  before_action :correct_user, only: [:edit,:update]
  before_action :check_login, only: :new
  def index
  	@users = User.all
  end		
  def new
  	@user = User.new
  end
  def create
  	@user = User.create user_params
  	if @user.save!
      # ConfirmMailJob.set(wait: 1.minutes).perform_later @user
      HelloJob.set(wait: 1.minutes).perform_later @user
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Please check your email to activate your account."
  		redirect_to root_path
  	end	
  end	
  def show
    @user = User.find_by id: params[:id]
    @posts = Post.where("user_id=?", @user.id)
  end
  def edit

  end 
  def update
    if @user.update! user_params
      redirect_to root_url
    end  
  end  

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end	
  def set_user
    @user = User.find_by id: params[:id]
    redirect_to root_url if @user.nil?
  end  
  def correct_user
    redirect_to root_path unless current_user.current_user?(@user)
  end  
  def check_login
    if logged_in?
      flash[:danger] = "bạn đã login"
      redirect_to root_path
    end  
  end  
end
