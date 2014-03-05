class Meetup < ActiveRecord::Base
	has_many :invitees
	has_many :users, through: :invitees
	belongs_to :user 
	validates :studying, presence: true
	validates :description, presence: true, length: {minimum: 6,maximum:300}
	validates :start_time, presence: true
	validates :end_time, presence: true
	validates :number_of_people, presence: true, numericality: {only_integer: true}

	def people_attending_meetup
		invitees.map{|person| person.user.first_name}.join(",")
	end

	def find_name_of_attendee
		users.where("user_id = ?", current_user.id).map{|user| user.first_name}
	end
end


