class CreateApplicationProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :application_projects do |t|

      t.timestamps
    end
  end
end
