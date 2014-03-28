require 'spec_helper'

describe "UserPages" do

	let(:user) {FactoryGirl.create(:user)}
	let(:subject) {FactoryGirl.create(:subject)}
	let(:topic) {FactoryGirl.create(:topic)}
	
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
			select('Chemistry', :from => 'subject_search')
			click_button "Search users"
		end
		it{should have_content("No users found")}
	end
end



