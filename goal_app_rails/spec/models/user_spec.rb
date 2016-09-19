# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string           not null
#

require 'rails_helper'

RSpec.describe User, :type => :model do


  subject(:user) { User.create!(username: "test_username", password: "password") }


  it { should validate_presence_of(:username)}
  it { should validate_length_of(:password).is_at_least(6)}

  it { should validate_presence_of(:password_digest)}
  it { should validate_presence_of(:session_token)}

  it { should have_many(:goals)}

  it "creates a password digest when a password is given" do
    expect(user.password_digest).to_not be_nil
  end

  it "sets a session token for the user" do
    expect(user.session_token).to_not be_nil
  end

  describe ".find_by_credentials" do
    before { user.save! }

    it "should not find a user when given invalid credentials" do
      expect(User.find_by_credentials("test_username", "bad_password")).to be_nil
    end

    it "should find a user when given valid credentials" do

      expect(User.find_by_credentials("test_username", "password")).to eq(user)
    end
  end

  describe "#is_password?" do
    it "should return true if password is correct" do
      expect(user.is_password?("password")).to be_truthy
    end

    it "should return false is password is incorrect" do
      expect(user.is_password?("bad_password")).to be_falsey
    end
  end

  describe "#reset_session_token!" do
    it "sets a new session token on the user" do
      old_session_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_session_token)
    end

    it "returns the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end
end
