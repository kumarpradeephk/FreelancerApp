class UsersController < ApplicationController

  def index
  end

  def home
    begin
      @all_projects = Project.where.not(user: current_user)
      #@all_projects.find(5).skills_categories.pluck(:tech_skills)
      @my_projects = current_user.projects.pluck(:id,:project_name,:description,:is_closed)
      #@proj = Project.find(Project.where.not(user: current_user).find(1).id)
      #@count=@proj.applied_user_completion_details.count()
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
          FreelanceMailer.signup_confirmation(@user).deliver
          flash[:notice] = "Signed Up successfully"
          redirect_to login_path
        end
      rescue  
        flash[:notice] = @user.errors.full_messages
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
   # end
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

def approved_project
  @application = AppliedUserCompletionDetail.find(params[:format])
  @project = Project.find(@application.project_id)
  @approved = AppliedDetail.new(project_name:@project.project_name,description:@project.description,user_id:@application.user_id)
  @project.applied_user_completion_details.find_by_project_id(@application.project_id).got_project = true
  if @approved.save!
    @project.is_closed = true 
    @application.got_project = true
    @application.save!
    @project.save!
    FreelanceMailer.project_approval(User.find(@application.user_id)).deliver
    flash[:notice] = "successfully approved"
    redirect_to showappliedproject_path(@application.project_id)
    #render json: {"message": "You have approve to this user", "User Details": User.find(@application.user_id).email}
  else
    render json: {"status": "failed to apply"}
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
  #render json: {"status": "declined user and mail sent.","user": User.find(@rejected_application.user_id)}
end

private
def user_params
  params.require(:user).permit(:username, :email, :password, :category)
end

def applied_user_params
  params.require(:params).permit(:start_date, :cost, :total_time)
end

end
