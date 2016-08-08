require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "GET #new" do
    it "renders the new template" do
      get :new, {}
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's username and password" do
        post :create, user: {username: "jack_bruce", password: ""}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end

      it "validates that the password is at least 6 characters long" do
        post :create, user: {username: "jack_bruce", password: "short"}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end

    end

    context "with valid params" do
      it "logs in the user" do
        post :create, user: {username: "jack_bruce", password: "password"}
        user = User.find_by_username("jack_bruce")
        expect(session[:session_token]).to eq(user.session_token)
      end

      it "redirects user to users show on success" do
        post :create, user: {username: "jack_bruce", password: "password"}
        user = User.find_by_username("jack_bruce")
        expect(response).to redirect_to(user_url(user))
      end

    end
  end
end
