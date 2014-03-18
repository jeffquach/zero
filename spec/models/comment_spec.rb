require 'spec_helper'

describe Comment do
  let(:user) {FactoryGirl.create(:user)}
  let(:comment) {FactoryGirl.create(:comment)}
  let(:meetup) {FactoryGirl.create(:meetup)}

  it "should show a comment belongs to a user from a meetup" do
  	comment.user = user
  	comment.should be_valid
  end
end
