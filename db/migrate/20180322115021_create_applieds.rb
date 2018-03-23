class CreateApplieds < ActiveRecord::Migration[5.1]
  def change
    create_table :applieds do |t|
      t.string :project_name
      t.text :descripton
      t.string :skill

      t.timestamps
    end
  end
end
