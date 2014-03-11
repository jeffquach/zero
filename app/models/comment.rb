class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :meetup
	validates :content, presence: true, length: {minimum: 3, maximum: 300}
end
