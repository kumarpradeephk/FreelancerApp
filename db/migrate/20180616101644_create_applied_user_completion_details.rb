class CreateAppliedUserCompletionDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :applied_user_completion_details do |t|
      t.date :start_date
      t.integer :cost
      t.integer :total_time
      
      t.timestamps
    end
  end
end
