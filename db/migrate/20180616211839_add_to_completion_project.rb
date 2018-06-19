class AddToCompletionProject < ActiveRecord::Migration[5.1]
  def change
  	add_reference :completion_projects, :project, index: true, foreign_key: true
  	add_reference :completion_projects, :applied_user_completion_detail, index: true, foreign_key: true
  end
end
