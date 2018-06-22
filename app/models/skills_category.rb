class SkillsCategory < ApplicationRecord
	has_many :project_skills_categories
	has_many :projects, through: :project_skills_categories
	before_save {self.tech_skills = tech_skills.downcase}
	validates :tech_skills, presence: true, uniqueness: { case_sensitive: false}

	attr_accessor :tech_skills

	searchable do 
		text :tech_skills
	end
end
