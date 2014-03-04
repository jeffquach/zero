class ChangeColumnonInvitees < ActiveRecord::Migration
  def change
  	remove_column :invitees, :response, :boolean
  	add_column :invitees, :response, :string, default: "no_reply"
  end
end
