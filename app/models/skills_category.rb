class SkillsCategory < ApplicationRecord
	has_many :project_skills_categories
	has_many :projects, through: :project_skills_categories
	validates :tech_skills, presence: true
end
