class RemoveColumnCategory < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :category
  end
end
