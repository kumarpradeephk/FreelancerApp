class UsersController < ApplicationController

  def index
  end

  def home
    begin
    if params[:search] == nil
    @all_projects = Project.where.not(user: current_user).where(is_closed:false)
    else
    @all_projects = SkillsCategory.find_by_tech_skills(params[:search]).projects.where.not(user: current_user)
        # #####sunspot
        # @search = SkillsCategory.search do
        #   fulltext params[:search]
        # end
        # #binding.pry
        # @all_projects = @search.results
        # #####sunspot end
    end
    rescue => e
      flash[:notice] = "no any project"
    end
    begin
     @my_projects = current_user.projects.pluck(:id,:project_name,:description,:is_closed)
    rescue => e
      flash[:notice] = "you are not logged in"
    end
  end

  def signup
  	@signup = User.new
  end

  def create
      @user = User.new(user_params)
      begin
        if @user.save!
        FreelanceMailer.signup_confirmation(@user).deliver
        flash[:notice] = "Signed Up successfully"
        redirect_to login_path
        end
      rescue  
        flash[:notice] = @user.errors.full_messages[0]
        redirect_to signup_path
      end
  end 

def apply
   begin 
    @proj = Project.find(params[:projectId])
    s_date = params[:start_date].to_s
    @applied = current_user.applied_user_completion_details.build(start_date: s_date,cost:params[:cost],total_time:params[:total_time])
    @applied.project = @proj
     if @applied.save! 
      @apply = AppliedUserCompletionDetail.last
      @proj.applied_user_completion_details << @apply
      flash[:notice] = "you have apllied for this project"
      redirect_to home_path
    end
  rescue => e
    flash[:notice] = e
    redirect_to home_path
  end
end

def fromforapplyproject
  
end

def applied
  userId = current_user.id
  @applied_confirmed = Project.joins(:applied_user_completion_details).where('applied_user_completion_details.got_project=1').where("applied_user_completion_details.user_id=#{userId}")
  @applied_project = Project.joins(:applied_user_completion_details).where('applied_user_completion_details.got_project=0').where("applied_user_completion_details.user_id=#{userId}")

end

def close_project
  begin
    project = Project.find(params[:format])
    project.is_closed = true
    if project.save!
      flash[:notice] = "successfully closed"
      redirect_to home_path
    end
  rescue
    flash[:notice] = "failed close request"
    redirect_to home_path 
  end
end

def approved_project
  @application = AppliedUserCompletionDetail.find(params[:format])
  @project = Project.find(@application.project_id)
  @application.got_project = true
  if @application.save!
    FreelanceMailer.project_approval(User.find(@application.user_id)).deliver
    flash[:notice] = "successfully approved"
    redirect_to showappliedproject_path(@application.project_id)
  else
    flash[:notice] = "failed your approval"
  end
end

def decline_user
  @rejected_application = AppliedUserCompletionDetail.find(params[:format])
  @rejected_project = Project.find(@rejected_application.project_id)
  @rejected_application.is_rejected = true
  @rejected_application.save!
  FreelanceMailer.rejection_mail(User.find(@rejected_application.user_id)).deliver
  flash[:notice] = "Decline success"
  redirect_to showappliedproject_path(@rejected_application.project_id)
end

private
def user_params
  params.require(:user).permit(:username, :email, :password, :category)
end

def applied_user_params
  params.require(:params).permit(:start_date, :cost, :total_time)
end

end
