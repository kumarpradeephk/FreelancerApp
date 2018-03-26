class AddToApplicationProject < ActiveRecord::Migration[5.1]
  def change
  	add_reference :application_projects, :project, index: true, foreign_key: true
  	add_reference :application_projects, :application, index: true, foreign_key: true
  end
end
