class Meetup < ActiveRecord::Base
	has_many :invitees
	has_many :users, through: :invitees
	belongs_to :user 
	validates :studying, :title, presence: true
	validates :description, presence: true, length: {minimum: 6,maximum:300}
	validates :start_time, presence: true
	validates :end_time, presence: true
	validates :number_of_people, presence: true, numericality: {only_integer: true}

	has_many :comments

	def people_attending_meetup
		invitees.map{|person| person.user.first_name}.join(", ")
	end
end


