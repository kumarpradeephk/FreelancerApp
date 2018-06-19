class CreateSkillsCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :skills_categories do |t|
      t.string :tech_skills
      
      t.timestamps
    end
  end
end
