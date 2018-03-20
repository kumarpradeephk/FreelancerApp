class Project < ApplicationRecord
	belongs_to :user
	validates :project_name, presence: true, length: {minimum: 2,maximum: 30}
	validates :description, presence: true
	validates :skill, presence: true
	validates :user_id, presence: true
end
