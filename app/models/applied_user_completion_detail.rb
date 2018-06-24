class AppliedUserCompletionDetail < ApplicationRecord
	belongs_to :user
	belongs_to :project
	VALID_DATE_REGX = /[12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])/i
	validates :start_date, presence: true, format: { with: VALID_DATE_REGX  }
	validates :cost, presence: true
	validates :total_time, presence: true
	validates_uniqueness_of :project_id, scope: [:user_id]
end
