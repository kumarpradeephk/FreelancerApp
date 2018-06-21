class AddCompletionDetailToAppliedDetail < ActiveRecord::Migration[5.1]
  def change
  	add_reference :applied_details, :applied_user_completion_detail, index: true, foreign_key: true
  end
end
