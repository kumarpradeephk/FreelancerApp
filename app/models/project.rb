class Project < ApplicationRecord
	belongs_to :user
	has_many :application_projects
	has_many :applications, through: :application_projects
	validates :project_name, presence: true, length: {minimum: 2,maximum: 30}
	validates :description, presence: true
	validates :skill, presence: true
end
