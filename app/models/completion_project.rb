class CompletionProject < ApplicationRecord
	belongs_to :project
	belongs_to :applied_user_completion_detail
end
