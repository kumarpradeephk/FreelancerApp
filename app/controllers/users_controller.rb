class UsersController < ApplicationController

  def index
  end

  def home
    @all_projects = Project.where.not(user: current_user).pluck(:skill,:description)
    @my_projects = current_user.projects.pluck(:skill,:description)
  end

  def signup
  	@signup = User.new
  end

  def create
  	begin
  		@user = User.new(user_params)
  		@user.save!
  	rescue => e 
  		flash[:notice] = "something error occured/username already exist/username too short"
  	end
  	redirect_to users_path
  end 

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :category)
  end
end
