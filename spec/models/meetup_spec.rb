require 'spec_helper'

describe Meetup do
  let(:user) {FactoryGirl.create(:user)}
  let(:meetup) {FactoryGirl.create(:meetup)}

  it "should allow user to create a meetup" do
  	meetup.user = user
  	meetup.should be_valid
  end

  it "shouldn't allow a user to create a meetup with an end time before start time" do
  	m = Meetup.new(title: "Thingy!", studying: "Javascript", description: "This stuff is awesome!", start_time: 1.hour.from_now, end_time: Time.now, user_id: user.id, number_of_people: 2)
  	m.should_not be_valid
  end

  it "shouldn't allow a user to create a meetup with 1 or 0 users" do
  	m = Meetup.new(title: "Thingy!", studying: "Javascript", description: "This stuff is awesome!", start_time: 1.hour.from_now, end_time: 3.hours.from_now, user_id: user.id, number_of_people: 1)
  	m.should_not be_valid
  end

  it "shouldn't allow a user to create a meetup in an interval greater than 8 hours apart" do
    m = Meetup.new(title: "Thingy!", studying: "Javascript", description: "This stuff is awesome!", start_time: 1.hour.from_now, end_time: 13.hours.from_now, user_id: user.id, number_of_people: 2)
    m.should_not be_valid
  end

  it "should allow a user to create a meetup in an interval less than 8 hours apart" do
    m = Meetup.create(title: "Thingy!", studying: "Javascript", description: "This stuff is awesome!", start_time: 1.hour.from_now, end_time: 5.hours.from_now, user_id: user.id, number_of_people: 2)
    m.should be_valid
  end

  it "shouldn't allow a user to create a meetup at a time before today" do
    m = Meetup.create(title: "Thingy!", studying: "Javascript", description: "This stuff is awesome!", start_time: 2.days.ago, end_time: 1.day.ago, user_id: user.id, number_of_people: 2)
    m.should_not be_valid
  end

  it "should let a user create a meetup on the same day" do
    m = Meetup.create(title: "Thingy!", studying: "Javascript", description: "This stuff is awesome!", start_time: 3.hours.from_now, end_time: 5.hours.from_now, user_id: user.id, number_of_people: 2)
    m.should be_valid
  end

  it "should return true" do
    m = Meetup.create(title: "Thingy!", studying: "Javascript", description: "This stuff is awesome!", start_time: 5.minutes.from_now, end_time: 5.hours.from_now, user_id: user.id, number_of_people: 2)
    expect(m.start_time_not_before_today).to be_false
  end

  it "should return false" do
    m = Meetup.create(title: "Thingy!", studying: "Javascript", description: "This stuff is awesome!", start_time: 5.minutes.ago, end_time: 5.hours.from_now, user_id: user.id, number_of_people: 2)
    expect(m.start_time_not_before_today).to be_true
  end
end
