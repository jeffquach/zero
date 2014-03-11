class Review < ActiveRecord::Base
	belongs_to :user 
	belongs_to :review_writer, class_name: "User"
	validates :content, presence: true, length: {minimum: 3, maximum: 300}
end
