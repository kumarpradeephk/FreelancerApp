class CreateAppliedDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :applied_details do |t|
      t.string :project_name
      t.string :description
      
      t.timestamps
    end
  end
end
