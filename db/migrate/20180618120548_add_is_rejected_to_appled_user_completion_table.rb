class AddIsRejectedToAppledUserCompletionTable < ActiveRecord::Migration[5.1]
  def change
  	add_column :applied_user_completion_details, :is_rejected, :boolean, default: false
  end
end
