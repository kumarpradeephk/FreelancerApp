class ProjectSkillsCategory < ApplicationRecord
	belongs_to :project
	belongs_to :skills_category
	validates_uniqueness_of :project_id, scope: [:skills_category_id]
end
