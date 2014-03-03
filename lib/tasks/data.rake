namespace :tingz do
	desc "Populate the database son!"
	task put_fluff_in_database: :environment do
	    99.times do |n|
	      first_name = Faker::Name.name
	      last_name = Faker::Name.name
	      email = "dipper-#{n+1}@bling.org"
	      password = "password"
	      User.create!(first_name: first_name, last_name: last_name, email: email, password: password, password_confirmation: password)
	    end
	end
end

