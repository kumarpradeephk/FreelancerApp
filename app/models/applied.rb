class Applied < ApplicationRecord
	belongs_to :user
	has_many :applied_projects
	has_many :projects, through: :applied_projects
	validates :project_name, presence: true, length: {minimum: 2,maximum: 30}
	validates :description, presence: true
	validates :skill, presence: true
end
