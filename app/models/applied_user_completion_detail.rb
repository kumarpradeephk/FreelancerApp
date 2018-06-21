class AppliedUserCompletionDetail < ApplicationRecord
	belongs_to :user
	belongs_to :project
	has_many :applied_details
	VALID_DATE_REGX = /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/i
	validates :start_date, presence: true
	validates :cost, presence: true
	validates :total_time, presence: true
end
