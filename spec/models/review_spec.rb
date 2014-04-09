require 'spec_helper'

describe Review do
  let(:user) {FactoryGirl.create(:user)}
  let(:review) {FactoryGirl.create(:review)}

  it "should associate a review with a user" do
  	review.user = user
  	review.should be_valid
  end
end
