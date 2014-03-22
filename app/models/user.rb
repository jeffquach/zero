class User < ActiveRecord::Base
  	authenticates_with_sorcery!
	mount_uploader :image, ImageUploader

	authenticates_with_sorcery!
	before_save {email.downcase!}
	validates_confirmation_of :password
	validates :password, presence: true, on: :create, length: {minimum: 6}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, uniqueness: {case_sensitive:false}, format: {with: VALID_EMAIL_REGEX}
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :address, presence: true
	validates :city, presence: true
	validates :state_province, presence: true
	validates :country, presence: true
	validates :learning, presence: true
	geocoded_by :full_address
	after_validation :geocode

	has_many :invitees
	
	has_many :user_friendships						

	# has_many :friends, through: :user_friendships,
	# 					conditions: { user_friendships: { state: 'accepted'} }
	
	# has_many :friends, -> {where state: 'accepted'}, through: :user_friendships

	has_many :friends, -> {where(user_friendships: {state: 'accepted'})}, through: :user_friendships

	has_many :pending_user_friendships, -> {where state: 'pending'}, class_name: 'UserFriendship',
	foreign_key: :user_id						

	has_many :pending_friends, through: :pending_user_friendships, source: :friend

	has_many :meetups, through: :invitees, dependent: :destroy

	has_many :comments, dependent: :destroy

	has_many :reviews, dependent: :destroy

	authenticates_with_sorcery! do |config|
		config.authentications_class = Authentication
	end

	has_many :authentications, :dependent => :destroy
	accepts_nested_attributes_for :authentications

	def full_address
		"#{self.address}, #{self.city}, #{self.state_province}, #{self.country}"
	end

	def full_name
		first_name + " " + last_name
	end

end
