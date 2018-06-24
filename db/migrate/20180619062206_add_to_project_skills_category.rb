class AddToProjectSkillsCategory < ActiveRecord::Migration[5.1]
  def change
  	add_reference :project_skills_categories, :project, index: true, foreign_key: true, null:false
  	add_reference :project_skills_categories, :skills_category, index: true, foreign_key: true, null: false
  end
end
