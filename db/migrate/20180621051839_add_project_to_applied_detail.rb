class AddProjectToAppliedDetail < ActiveRecord::Migration[5.1]
  def change
  	add_reference :applied_details, :project, index: true, foreign_key: true
  end
end
