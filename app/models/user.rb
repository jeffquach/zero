class User < ActiveRecord::Base
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
	geocoded_by :parsed_address
	after_validation :geocode, if: :address_changed?
	after_validation :geocode, if: :city_changed?
	after_validation :geocode, if: :country_changed?
	after_validation :geocode, if: :state_province_changed?

	has_many :invitees
	
	has_many :user_friendships						
	
	# has_many :friends, -> {where state: 'accepted'}, through: :user_friendships

	has_many :friends, -> {where(user_friendships: {state: 'accepted'})}, through: :user_friendships

	has_many :pending_user_friendships, class_name: 'UserFriendship',
										foreign_key: :user_id,
										conditions: { state: 'pending'}

	has_many :pending_friends, through: :pending_user_friendships, source: :friend

	has_many :meetups, through: :invitees, dependent: :destroy

	has_many :comments, dependent: :destroy

	has_many :reviews, dependent: :destroy

	def parsed_address
		"#{self.address}, #{self.city}, #{self.state_province}, #{self.country}"
	end
end