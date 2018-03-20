class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.text :description
      t.string :skill

      t.timestamps
    end
  end
end
