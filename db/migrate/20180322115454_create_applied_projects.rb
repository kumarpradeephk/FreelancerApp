class CreateAppliedProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :applied_projects do |t|

      t.timestamps
    end
  end
end
