class AppliedProject < ApplicationRecord
	belongs_to :project
	belongs_to :applied
end
