class ProjectsController < ApplicationController
	def new
		@project = Project.new
	end

	def show
		@project_detail = Project.find(params[:id])
	end

	def view
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
    #render plain: params[:project].inspect
end

private
def project_params
	params.require(:project).permit(:project_name, :description, :skill) 
end
end
