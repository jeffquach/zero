class RemoveLearningFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :learning, :string
  end
end
