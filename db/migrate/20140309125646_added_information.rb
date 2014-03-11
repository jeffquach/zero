class AddedInformation < ActiveRecord::Migration

  def change
  	add_column :users, :currently_available, :string
  	add_column :users, :study_location_available, :boolean
  	add_column :users, :current_online_learning, :string
  	add_column :users, :education, :text
  	add_column :users, :languages, :text
  	add_column :users, :skills, :text 
  end
end
