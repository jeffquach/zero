require 'spec_helper'

describe User do
  let(:user) {FactoryGirl.create(:user)}
  let(:review) {FactoryGirl.create(:review)}

  # it "should calculate the average rating of a user" do
  # 	user.average_rating.should == BigDecimal.new("4.5")
  # end

  # it "should calculate the average rating with multiple ratings for a user" do
  # 	r = Review.create(content: "Shabazz son!", user_id: user.id, rating: 1.5)
  # 	user.average_rating.should == BigDecimal.new("4.5") + BigDecimal.new("1.5")
  # end

  
end
