class AppliedDetail < ApplicationRecord
	belongs_to :user
	belongs_to :project
	belongs_to :applied_user_completion_detail
end
