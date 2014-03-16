class Meetup < ActiveRecord::Base
	has_many :invitees
	has_many :users, through: :invitees
	belongs_to :user 
	validates :studying, :title, presence: true
	validates :description, presence: true, length: {minimum: 6,maximum:300}
	validates :start_time, presence: true
	validates :end_time, presence: true
	validates :number_of_people, presence: true, numericality: {only_integer: true}

	validate :end_time_before_start_time
	validate :at_least_two_people_attending_meetup

	has_many :comments

	def people_attending_meetup
		invitees.map{|person| person.user.first_name}.join(", ")
	end

	def end_time_before_start_time
		if start_time >= end_time
			errors.add(:base, "You can't create a meetup with your chosen times!")
		end
	end

	def at_least_two_people_attending_meetup
		if number_of_people < 2
			errors.add(:base, "You have to have at least 2 people at your meetup!")
		end
	end
end


