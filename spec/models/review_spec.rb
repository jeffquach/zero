require 'spec_helper'

describe Review do
  let(:user) {FactoryGirl.create(:user)}
  let(:review) {FactoryGirl.create(:review)}

  it "should associate a review with a user" do
  	review.user = user
  	review.should be_valid
  end

  it "shouldn't allow a user to create a review unless they have finished a meetup with someone else" do
  	review.should_not be_valid
  end
end
