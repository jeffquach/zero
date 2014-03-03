class Meetup < ActiveRecord::Base
	has_many :invitees
	has_many :users, through: :invitees
end
