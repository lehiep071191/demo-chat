class UsersController < ApplicationController

  def index
  	@users = User.all
  end		
  def new
  	@user = User.new
  end
  def create
  	@user = User.create user_params
  	if @user.save!
      log_in @user
  		flash[:success] = 'welcome to you'
  		redirect_to root_path
  	end	
  end	
  def show
    @user = User.find_by id: params[:id]
  end
  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end	

end
