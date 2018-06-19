class AddUserToAppliedUserCompletionDetail < ActiveRecord::Migration[5.1]
  def change
  	add_reference :applied_user_completion_details, :user, index: true, foreign_key: true
  end
end
