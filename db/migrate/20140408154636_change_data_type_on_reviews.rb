class ChangeDataTypeOnReviews < ActiveRecord::Migration
  def change
  	add_column :reviews, :rating, :decimal, default: 0.0
  end
end
