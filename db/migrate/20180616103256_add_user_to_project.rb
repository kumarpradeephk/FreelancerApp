class AddUserToProject < ActiveRecord::Migration[5.1]
  def change
  	add_reference :projects, :user, index: true, foreign_key: true, null: false
  end
end
