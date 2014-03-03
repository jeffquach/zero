class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.string :studying
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.integer :number_of_people

      t.timestamps
    end
  end
end
