require 'spec_helper'

describe "UserPages" do

	let(:user) {FactoryGirl.create(:user)}
	
	subject{page}

	describe "an invalid request to edit another user's information" do
		before {patch user_path(user)}
		specify{expect(response).to redirect_to(login_path)}
	end

	# describe "a user trying to change another user's information" do
	# 	let(:other_user) {FactoryGirl.create(:user, email: "sumting@wong.com")}
	# 	before do
	# 		sign_in user
	# 		get edit_user_path(other_user)
	# 	end
	# 	specify{expect(response).to redirect_to(login_path)}
	# 	before{delete user_path(other_user)}
	# 	specify{expect(response).to redirect_to(login_path)}
	# end

	describe "entering invalid information when searching for a user on the home page" do
		before do
			visit root_path
			click_button "Search users"
		end
		it{should have_content("The search field cannot be blank!")}
	end

	describe "when a user is not found" do
		before do
			visit root_path
			fill_in "city_search", with: "Las Vegas"
			has_select?('subject_search',selected: "Chemistry")
			has_select?('topic_search',selected: "Python")
			click_button "Search users"
		end
		# it {should have_content("No users found")}
	end

	describe "sending a friend request" do
		let(:other_user) {FactoryGirl.create(:user)}
		before do
			visit root_path
			user.activate!
			click_link "Log in"
			fill_in "Email", with: user.email
			fill_in "Password", with: "tingzaregood" # Hardcoded the password to get this mother to work!
			click_button "Log in"
			visit user_path(user)
			click_button "Send study partner request"
		end
		it {should have_content(other_user.first_name)}
		it {should have_content("Reviews")}
		it {should have_content("See full bio")}
		it {should have_content("Study partner request sent")}
	end
end



