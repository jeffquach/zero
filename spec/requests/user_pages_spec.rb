require 'spec_helper'

describe "UserPages" do

	let(:user) {FactoryGirl.create(:user)}
	
	subject {page}

	describe "an invalid request to edit another user's information" do
		before {patch user_path(user)}
		specify{expect(response).to redirect_to(login_path)}
	end

	describe "a user trying to change another user's information" do
		let(:other_user) {FactoryGirl.create(:user, email: "sumting@wong.com")}
		before do
			sign_in user
			get edit_user_path(other_user)
		end
		specify{expect(response).to redirect_to(login_path)}
		before{delete user_path(other_user)}
		specify{expect(response).to redirect_to(login_path)}
	end

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
			FactoryGirl.create_list(:subject, 1)
			fill_in "city_search", with: "Las Vegas"
			select "Computer Science", from: "subject_search"
			select "Ruby", from: "topic_search"
			click_button "Search users"
		end
		# it {should have_content("No users found")}
	end

	describe "sending a friend request" do
		let(:other_user) {FactoryGirl.create(:user)}
		before do
			visit root_path
			user.activate!
			sign_in user
			visit user_path(user)
			click_button "Send study partner request"
		end
		it {should have_content(other_user.first_name)}
		it {should have_content("Reviews")}
		it {should have_content("See full bio")}
		it {should have_content("Study partner request sent")}
	end

	describe "adding a topic" do
		before do
			user.activate!
			sign_in user
			FactoryGirl.create_list(:subject, 1)
			click_link "Learning"
			find(:css, 'select#subject_id').value
			select('Computer Science', from: 'subject_id')
			fill_in "topic_name", with: "Ruby"
			select "Beginner", from: "topic_experience"
			click_button "Create Topic"
			# find('#subject_id').find(:xpath, 'option[5]').select_option
		end
		it {should have_content("Subjects I am studying")}
		it {should have_content("Add topic")}
		it {should have_content("Ruby")}
	end
end



