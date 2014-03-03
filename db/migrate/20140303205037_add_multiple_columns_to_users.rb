class AddMultipleColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state_province, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
