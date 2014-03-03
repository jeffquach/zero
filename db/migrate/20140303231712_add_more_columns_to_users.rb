class AddMoreColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :learning, :string
  	add_column :users, :preferred_gender, :string
  	add_column :users, :smoking_allowed, :string
  	add_column :users, :has_pets, :string
  	add_column :users, :can_host_pets, :string
  	add_column :users, :can_host_children, :string
  	add_column :users, :description, :string
  end
end
