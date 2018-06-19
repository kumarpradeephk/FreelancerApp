class AddUserToAppliedDetail < ActiveRecord::Migration[5.1]
  def change
  	add_reference :applied_details, :user, index: true, foreign_key: true
  end
end
