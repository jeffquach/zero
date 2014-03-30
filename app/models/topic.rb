class Topic < ActiveRecord::Base
	belongs_to :subject
	belongs_to :user
	accepts_nested_attributes_for :subject
	validates_presence_of :name, message: "of topic cannot be blank"
	validates :experience, presence: true
	validates_associated :subject
end
