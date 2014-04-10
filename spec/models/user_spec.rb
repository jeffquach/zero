require 'spec_helper'

describe User do
  let(:user) {FactoryGirl.create(:user)}

  it "should calculate the average rating of a user" do
    user.reviews.create(content: "Ching chong meng!!!", rating: 4.5)
  	user.average_rating.should == BigDecimal.new("4.5")
  end

  it "should calculate the average rating with multiple ratings for a user" do
    user.reviews.create(content: "Ching chong meng!!!", rating: 4.5)
    user.reviews.create(content: "Ching chong meng!!!", rating: 1.5)
  	user.average_rating.should == (BigDecimal.new("4.5") + BigDecimal.new("1.5"))/2
  end

  it "should return true showing a user's meetups that have already finished" do
    user.meetups.create!(title: "Study",description: "Holla at a boss son!",studying: "Javascript",start_time: 1.hour.from_now,end_time: 3.hours.from_now,number_of_people: 2)
    Timecop.freeze(DateTime.now)
    new_time = 6.hours.from_now
    Timecop.travel(new_time) do
      expect(user.finished_meetup?).to be_true
    end
  end

    it "should return true showing a user's meetups that have already finished" do
    user.meetups.create!(title: "Study",description: "Holla at a boss son!",studying: "Javascript",start_time: 1.hour.from_now,end_time: 3.hours.from_now,number_of_people: 2)
    Timecop.freeze(DateTime.now)
    new_time = 181.minutes.from_now
    Timecop.travel(new_time) do
      expect(user.finished_meetup?).to be_true
    end
  end

  it "should return false when a user's meetups that haven't finished" do
    user.meetups.create!(title: "Study",description: "Holla at a boss son!",studying: "Javascript",start_time: 1.hour.from_now,end_time: 3.hours.from_now,number_of_people: 2)
    Timecop.freeze(DateTime.now)
    new_time = 2.hours.from_now
    Timecop.travel(new_time) do
      expect(user.finished_meetup?).to be_false
    end
  end
  
end
