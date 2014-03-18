class CreateReviewsTable < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
	  t.text :content
      t.integer :user_id
      t.integer :review_writer_id

      t.timestamps
    end
  end
end
