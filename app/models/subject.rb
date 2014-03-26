class Subject < ActiveRecord::Base
	has_many :topics
	has_many :users, through: :topics, dependent: :destroy
	validates :name, presence: true
end
