class UsersController < ApplicationController

  def index
  end

  def home
    begin
    if params[:search] == nil
    @all_projects = Project.where.not(user: current_user)
    #####sunspot
        # @search = SkillsCategory.search do
        #   fulltext params[:search]
        # end
    else
    @all_projects = SkillsCategory.find_by_tech_skills(params[:search]).projects.where.not(user: current_user)
    end
    #####sunspot end
     @my_projects = current_user.projects.pluck(:id,:project_name,:description,:is_closed)
    rescue
      flash[:notice] = "No project available."
    end
  end

  def signup
  	@signup = User.new
  end

  def create
      @user = User.new(user_params)
      begin
        if @user.save!
        #FreelanceMailer.signup_confirmation(@user).deliver
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
  rescue
    flash[:notice] = "oops!,something error occured in apply/already applied."
    redirect_to home_path
  end
end

def fromforapplyproject
  
end

def applied
  @applied_confirmed = current_user.applied_details.pluck(:id,:project_name,:description)
  @applied_project_id = current_user.applied_user_completion_details.where(got_project:0).pluck(:project_id)

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
  @approved = AppliedDetail.new(project_name:@project.project_name,description:@project.description,user_id:@application.user_id,project_id:@application.project_id,applied_user_completion_detail_id:@application.id)
  @application.got_project = true
  if @approved.save! 
    @application.save!
    @project.save!
    #FreelanceMailer.project_approval(User.find(@application.user_id)).deliver
    flash[:notice] = "successfully approved"
    redirect_to showappliedproject_path(@application.project_id)
  else
    render json: {"status": "failed to apply"}
  end
end

def decline_user
  @rejected_application = AppliedUserCompletionDetail.find(params[:format])
  @rejected_project = Project.find(@rejected_application.project_id)
  @rejected_application.is_rejected = true
  @rejected_application.save!
  #FreelanceMailer.rejection_mail(User.find(@rejected_application.user_id)).deliver
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
