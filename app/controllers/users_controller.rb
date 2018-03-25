class UsersController < ApplicationController

  def index
  end

  def home
    begin

      @all_projects = Project.where.not(user: current_user).all.group_by(&:skill)
      @my_projects = current_user.projects.pluck(:skill,:description)
    rescue
      flash[:notice] = "Not any project avialable."
    end
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

  def apply
    begin 
      @project = Project.find(params[:id])
      applied = current_user.applieds.new(project_name:@project.project_name,description:@project.description,skill:@project.skill)
      if applied.save!
        @project.isapplied = true 
        @project.save!
        @apply = Applied.last
        @project.applieds << @apply
        flash[:notice] = "you have apllied for this project"
        redirect_to home_path
      end
    rescue
      flash[:notice] = "Not applied,something error"
      redirect_to home_path
    end
  end

  def applied
    @apply = current_user.applieds.pluck(:skill,:description)
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :category)
  end
end
