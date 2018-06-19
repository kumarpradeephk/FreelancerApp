class AppliedUserCompletionDetail < ApplicationRecord
	belongs_to :user
	belongs_to :project
	has_many :completion_projects
	has_many :projects, through: :completion_projects
	validates :start_date, presence: true
	validates :cost, presence: true
	validates :total_time, presence: true
end
