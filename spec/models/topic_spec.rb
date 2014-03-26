require 'spec_helper'

describe Topic do
  let(:user) {FactoryGirl.create(:user)}
  let(:topic) {FactoryGirl.create(:topic)}

  it "should show a user from a topic" do
  	topic.user = user
  	topic.should be_valid
  end
end
