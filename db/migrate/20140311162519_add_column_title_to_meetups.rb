class AddColumnTitleToMeetups < ActiveRecord::Migration
  def change
  	add_column :meetups, :title, :string
  end
end
