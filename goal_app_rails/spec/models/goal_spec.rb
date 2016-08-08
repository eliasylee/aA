require 'rails_helper'

RSpec.describe Goal, :type => :model do

  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:body)}
  it { should validate_presence_of(:user_id)}

  it { should belong_to(:user)}

  subject(:goal) { Goal.new(name: "goal app",
                            body: "finish goal app",
                            user_id: 1,
                            completed: false,
                            deadline: 10.days.from_now,
                            private: false)}

  describe "#completed?" do
    it "should allow user to check whether or not goal has been completed" do
      expect(goal.completed?).to be_falsey
    end
  end

  describe "#days_left" do
    it "should allow user to see how many days before deadline" do
      expect(goal.days_left).to eq(10)
    end
  end

end
