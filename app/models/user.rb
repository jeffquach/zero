class User < ActiveRecord::Base
	authenticates_with_sorcery!
	before_save {email.downcase!}
	validates_confirmation_of :password
	validates :password, presence: true, on: :create, length: {minimum: 6}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, uniqueness: {case_sensitive:false}, format: {with: VALID_EMAIL_REGEX}
	validates :first_name, presence: true
	validates :last_name, presence: true
end
