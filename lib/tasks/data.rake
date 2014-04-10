namespace :tingz do
	desc "Populate the database son!"
	task put_fluff_in_database: :environment do
		make_users
	end

	def make_users
		99.times do |n|
	      first_name = Faker::Name.name
	      last_name = Faker::Name.name
	      email = "dipper-#{n+1}@bling.org"
	      password = "password"
	      address = Faker::Address.street_address
	      city = Faker::Address.city
	      state_province = Faker::Address.state
	      country = Faker::Address.country
	      latitude = Faker::Address.latitude
	      longitude = Faker::Address.longitude
	      User.create!(first_name: first_name, last_name: last_name, email: email, password: password, password_confirmation: password, address: address, city: city, state_province: state_province, country: country, latitude: latitude, longitude: longitude)
	    end
	end
end

namespace :brap do
	desc "Make topics son!"
	task make_topics_haters: :environment do
		make_topics
	end
	def make_topics
		users = User.all
		8.times do |n|
			index = rand(8)
			exp_index = rand(4)
			experience = ["Beginner","Novice","Intermediate","Advanced","Expert"]
			topics = ["Ruby","Javascript","C++","Python","C","Java", "Perl","PHP","Objective-C"]
			users.each{|u| u.topics.create!(name: topics[index],user_id:n+1,subject_id:29, experience: experience[exp_index])}
		end
	end
end


