require 'spec_helper'

describe "UserPages" do

	let(:user) {FactoryGirl.create(:user)}
	
	subject{page}

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
end



