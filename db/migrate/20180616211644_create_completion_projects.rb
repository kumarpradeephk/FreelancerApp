class CreateCompletionProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :completion_projects do |t|

      t.timestamps
    end
  end
end
