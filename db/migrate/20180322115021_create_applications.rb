class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.string :project_name
      t.text :description
      t.string :skill

      t.timestamps
    end
  end
end
