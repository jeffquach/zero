namespace :tingz do
	desc "Populate the database son!"
	task put_fluff_in_database: :environment do
		make_users
	end

	def make_users
		39.times do |n|
	      first_name = Faker::Name.name
	      last_name = Faker::Name.name
	      email = "dipper-#{n+3}@chingchong.org"
	      password = "password"
	      address = "#{n+823} Yonge St."
	      city = "Toronto"
	      state_province = "Ontario"
	      country = "Canada"
	      bio = "I'm da bomb son!!!" + Faker::Company.catch_phrase
	      User.create!(first_name: first_name, last_name: last_name, email: email, password: password, password_confirmation: password, address: address, city: city, state_province: state_province, country: country,bio:bio)
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
		2.times do |n|
			index = rand(1)
			exp_index = rand(1)
			experience = ["Beginner","Novice"]
			topics = ["Ruby","Javascript"]
			users[39..-1].each{|u| u.topics.create!(name: topics[index],user_id:n+1,subject_id:29, experience: experience[exp_index])}
		end
	end
end


