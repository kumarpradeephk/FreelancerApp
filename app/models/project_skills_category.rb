class ProjectSkillsCategory < ApplicationRecord
	belongs_to :project
	belongs_to :skills_category
end
