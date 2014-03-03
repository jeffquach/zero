class CreateInvitees < ActiveRecord::Migration
  def change
    create_table :invitees do |t|
      t.integer :user_id
      t.integer :meetup_id
      t.boolean :response

      t.timestamps
    end
  end
end
