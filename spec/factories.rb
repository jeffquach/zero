FactoryGirl.define do
	factory :user do
		first_name "Billy"
		last_name "Blanks"
		sequence(:email) {|n| "shanker#{n}@bling.com"}
		address "220 King St. W."
		city "Toronto"
		state_province "ON"
		country "Canada"
		password "tingzaregood"
		password_confirmation "tingzaregood"
	end

	factory :admin do
		admin true
	end

	factory :meetup do
		title "Let's study Javascript!"
		studying "Javascript"
		description "Javascript is the coolest thing in the world"
		start_time 1.hour.from_now
		end_time 3.hours.from_now
		number_of_people 2
		user
	end

	factory :comment do
		content "This stuff is awesome dude!"
		meetup
		user
	end

	factory :review do
		content "This guy is good meng!"
		user
	end

	factory :subject_name do
		name "Computer science"
	end

	factory :topic do
		name "Javascript"
		experience "Beginner"
		user
		subject
	end

	factory :subject do
    	name "Computer Science"
  	end
end




