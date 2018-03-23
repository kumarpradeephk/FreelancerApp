class RenameAppliedAttributeDescription < ActiveRecord::Migration[5.1]
  def change
  	rename_column(:applieds, :descripton, :description)
  end
end
