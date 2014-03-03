FactoryGirl.define do
	factory :user do
		first_name "Billy"
		last_name "Blanks"
		sequence(:email) {|n| "shanker#{n}@bling.com"}
		password "tingzaregood"
		password_confirmation "tingzaregood"
	end

	factory :admin do
		admin true
	end
end


