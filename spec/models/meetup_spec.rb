require 'spec_helper'

describe Meetup do
  let(:user) {FactoryGirl.create(:user)}
  let(:meetup) {FactoryGirl.create(:meetup)}

  it "should allow user to create a meetup" do
  	meetup.user = user
  	meetup.should be_valid
  end

  it "shouldn't allow a user to create a meetup with an end time before start time" do
  	m = Meetup.new(studying: "Javascript", description: "This stuff is awesome!", start_time: 1.hour.from_now, end_time: Time.now, user_id: user.id, number_of_people: 2)
  	m.should_not be_valid
  end

  it "shouldn't allow a user to create a meetup with 1 or 0 users" do
  	m = Meetup.new(studying: "Javascript", description: "This stuff is awesome!", start_time: 1.hour.from_now, end_time: 3.hours.from_now, user_id: user.id, number_of_people: 1)
  	m.should_not be_valid
  end
end
