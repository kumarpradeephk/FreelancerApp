class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def show
    begin
      @project = Project.find(params[:id])
      @admin_id = @project.user_id
      @category = @project.skills_categories.pluck(:tech_skills)
      @project_cost_and_user_info = @project.applied_user_completion_details.where(got_project:1)
    rescue => e
      flash[:notice] = "no project exist"
      redirect_to users_path
    end
  end

  def view
  end

  def showappliedproject
    begin
      @proj = Project.find(params[:format])
      @all_application = @proj.applied_user_completion_details.where(is_rejected: 0).pluck(:id,:start_date,:cost,:total_time,:got_project,:project_id)
    rescue
      flash[:notice] = "No any project/error."
    end
  end


  def category_to_id(cat)
    (1...cat.length).each do |i|
      if(cat[i].to_i == 0)
        cat[i] = (SkillsCategory.find_by_tech_skills(cat[i]).id).to_s
      end
    end
    return cat
  end

  def create
    begin
      categ = project_params["skills_category_ids"]
      new_category = []
      categ[1..categ.length].each do |item| 
      new_category << {"tech_skills": item} if(item.to_i == 0)
      end
      SkillsCategory.create(new_category)
      proj = project_params
      proj["skills_category_ids"] = category_to_id(categ)
      @project = current_user.projects.new(proj)
      if @project.save!
        flash[:notice] =  " Successfully posted your project "
        redirect_to home_path
      end
    rescue => e
      flash[:notice] = e
      redirect_to new_project_path
    end
  end

  private

  def project_params
    params.require(:project).permit(:project_name, :description, skills_category_ids: []) 
  end
end
