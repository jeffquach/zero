class AddExperienceColumnToTopics < ActiveRecord::Migration
  def change
  	add_column :topics, :experience, :string
  	add_index :topics, :name
  end
end
