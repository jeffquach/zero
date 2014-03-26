class Topic < ActiveRecord::Base
	belongs_to :subject
	belongs_to :user
	accepts_nested_attributes_for :subject
	validates :name, presence: true
end
