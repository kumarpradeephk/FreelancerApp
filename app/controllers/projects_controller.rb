class ProjectsController < ApplicationController
	def new
		@project = Project.new
	end

	def view
	end

	def create
		begin
			@project = current_user.projects.new(project_params)
			if @project.save!
				flash[:notice] =  " Successfully posted your project "
			end
		rescue  => e
			flash[:notice] = "something error/field can't be blank"
		end
		redirect_to home_path
    #render plain: params[:project].inspect
end

private
def project_params
	params.require(:project).permit(:project_name, :description, :skill) 
end
end
