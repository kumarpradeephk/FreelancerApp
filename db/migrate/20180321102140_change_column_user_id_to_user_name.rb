class ChangeColumnUserIdToUserName < ActiveRecord::Migration[5.1]
  def change
  	rename_column(:users, :user_id, :username)
  end
end
