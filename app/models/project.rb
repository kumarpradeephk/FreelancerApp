class Project < ApplicationRecord
	belongs_to :user
	has_many :applied_details
	has_many :applied_user_completion_details
	has_many :project_skills_categories
	has_many :skills_categories, through: :project_skills_categories
	validates :project_name, presence: true, length: {minimum: 2,maximum: 100}
	validates :description, presence: true
end
