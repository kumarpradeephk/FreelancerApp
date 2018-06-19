class ProjectsController < ApplicationController
	def new
		@project = Project.new
	end

	def show
		@project_detail = Project.find(params[:id])
		@category = @project_detail.skills_categories.pluck(:tech_skills)
		@project_cost_info = @project_detail.applied_user_completion_details.where(got_project:1).pluck(:id,:start_date,:cost,:total_time,:user_id,:project_id)
	end

	def view
	end

	def showappliedproject
		begin
  		@proj = Project.find(params[:format])
  		@all_application = @proj.applied_user_completion_details.where(is_rejected: 0).pluck(:id,:start_date,:cost,:total_time,:got_project,:is_rejected)
  		# app = proj.applied_user_completion_details
  		# app.find_by_project_id(1).got_project
  		# proj.applied_user_completion_details.find_by_project_id(1).got_project
  		rescue
  			flash[:notice] = "No any project/error."
  		end
	end

	def create
		begin
			@project = current_user.projects.new(project_params)
			if @project.save!
				flash[:notice] =  " Successfully posted your project "
				redirect_to home_path
			end
		rescue  => e
			flash[:notice] = "Something error in posting project"
			redirect_to new_project_path
		end
end

private
def project_params
	params.require(:project).permit(:project_name, :description, skills_category_ids: []) 
end
end
