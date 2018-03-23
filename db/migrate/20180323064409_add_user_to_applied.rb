class AddUserToApplied < ActiveRecord::Migration[5.1]
  def change
  	add_reference :applieds, :user, index: true, foreign_key: true
  end
end
