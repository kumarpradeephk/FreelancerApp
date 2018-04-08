class UsersController < ApplicationController

  def index
  end

  def home
    begin
      @all_projects = Project.where.not(user: current_user).all.group_by(&:skill)
      @my_projects = current_user.projects.pluck(:id,:skill,:description)
    rescue
      flash[:notice] = "No any project."
    end
  end

  def signup
  	@signup = User.new
  end

  def create
      @user = User.new(user_params)
      begin
        if @user.save!
          redirect_to login_path
        end
      rescue  
        flash[:notice] = @user.errors.full_messages
        redirect_to signup_path
      end
  end 

def apply
  begin 
    @project = Project.find(params[:id])
    @applied = current_user.applications.new(project_name:@project.project_name,description:@project.description,skill:@project.skill)
    if @applied.save!
      @project.is_closed = true 
      @project.save!
      @apply = Application.last
      @project.applications << @apply
      flash[:notice] = "you have apllied for this project"
      redirect_to home_path
    end
  rescue
    flash[:notice] = "oops!,something error occured in apply"
    redirect_to home_path
  end
end

def applied
  @applied_project = current_user.applications.pluck(:id,:skill,:description)
end

private
def user_params
  params.require(:user).permit(:username, :email, :password, :category)
end
end
