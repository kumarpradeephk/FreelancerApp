class AddToAppliedProject < ActiveRecord::Migration[5.1]
  def change
  	add_reference :applied_projects, :project, index: true, foreign_key: true
  	add_reference :applied_projects, :applied, index: true, foreign_key: true
  end
end
