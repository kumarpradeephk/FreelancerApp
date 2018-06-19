class AddGotProjectToAppledUserCompletionTable < ActiveRecord::Migration[5.1]
  def change
  	add_column :applied_user_completion_details, :got_project, :boolean, default: false
  end
end
