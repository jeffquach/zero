class Invitee < ActiveRecord::Base
	belongs_to :user
	belongs_to :meetup
	STATUS = %w(no_reply yes no maybe)
	validates :response, presence: true, inclusion: {in: STATUS}
	validates :user_id, presence: true
	validates :meetup_id, presence: true
end

