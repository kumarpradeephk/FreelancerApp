class AddEnumCategoryToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :category, :integer, limit: 3, null: false, default: 0
  end
end
