require 'spec_helper'
require 'rails_helper'

feature "the signup process" do


  scenario "has a new user page"  do
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end

  scenario "has input fields for username and password" do
    visit new_user_url
    expect(page).to have_content "Username"
    expect(page).to have_content "Password"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'Username', :with => "testing_username"
      fill_in 'Password', :with => "biscuits"
      click_on "Sign Up"
    end

    scenario "redirects to users show page" do
      user = User.find_by_username("testing_username")
      expect(current_path).to eq(user_path(user))
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content "testing_username"
    end

  end

end

feature "logging in" do
  before(:each) do
    visit new_user_url
    fill_in 'Username', :with => "testing_username"
    fill_in 'Password', :with => "biscuits"
    click_on "Sign Up"
  end

  scenario "shows username on the homepage after login" do
    expect(page).to have_content "testing_username"
  end

end

feature "logging out" do
  before(:each) do
    visit new_user_url
    fill_in 'Username', :with => "testing_username"
    fill_in 'Password', :with => "biscuits"
    click_on "Sign Up"
  end

  scenario "begins with a logged out state" do
    expect(page).to have_content "Sign Out"
    click_link "Sign Out"

    expect(current_path).to eq(new_session_path)
    expect(page).to have_content 'Sign In'
    expect(page).to have_content 'Username'
  end

  scenario "doesn't show username on the homepage after logout" do
    click_link "Sign Out"
    visit users_url
    expect(page).to_not have_content "testing_username"
  end

end
