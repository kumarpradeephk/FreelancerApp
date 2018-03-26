class AddIsClosedColumnToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :is_closed, :boolean, default: false
  end
end
