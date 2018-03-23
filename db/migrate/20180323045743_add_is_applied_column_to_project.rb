class AddIsAppliedColumnToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :isapplied, :boolean, default: false
  end
end
