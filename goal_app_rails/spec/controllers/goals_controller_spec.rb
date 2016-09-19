require 'rails_helper'

RSpec.describe GoalsController, :type => :controller do
  let(:jack_bruce) { User.create!(username: "jack_bruce", password: "abcdef") }
  let(:unauthorized) { User.create!(username: "unauthorized", password: "abcdeff") }

  subject(:goal) { Goal.create!(name: "goal app",
                                body: "finish goal app",
                                user_id: 1,
                                completed: false,
                                deadline: 10.days.from_now,
                                private: true)}

  let(:goal2) { Goal.create!(name: "public goal app",
                                body: "finish goal app",
                                user_id: 1,
                                completed: false,
                                deadline: 10.days.from_now,
                                private: false)}

  describe "GET #new" do
    it "renders the new template" do
      allow(controller).to receive(:current_user) { jack_bruce }
      get :new, {}
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do

    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "redirects to the login page" do
        post :create, goal: { name: "goal app",
                                  body: "finish goal app",
                                  user_id: 1,
                                  completed: false,
                                  deadline: 10.days.from_now,
                                  private: false }
        expect(response).to redirect_to(new_session_url)
      end
    end

    context "when logged in" do
      before do
        allow(controller).to receive(:current_user) { jack_bruce }
      end

      context "with valid params" do
        it "redirects to goal show page on success" do
          post :create, goal: { name: "goal app",
                                    body: "finish goal app",
                                    user_id: 1,
                                    completed: false,
                                    deadline: 10.days.from_now,
                                    private: false }
          expect(response).to render_template(:show)
        end
      end

      context "with invalid params" do
        it "flashes errors" do
          post :create, goal: { name: "goal app",
                                    user_id: 1,
                                    completed: false,
                                    deadline: 10.days.from_now,
                                    private: false }
          expect(flash[:errors]).to be_present
        end
      end

    end
  end

  describe "GET #edit" do

    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "redirects to the login page" do
        post :create, goal: { name: "goal app",
                                  body: "finish goal app",
                                  user_id: 1,
                                  completed: false,
                                  deadline: 10.days.from_now,
                                  private: false }
        expect(response).to redirect_to(new_session_url)
      end
    end

    context "when logged in" do
      before do
        allow(controller).to receive(:current_user) { jack_bruce }
      end

      it "renders the edit template" do
        get :edit, {}
        expect(response).to render_template("edit")
      end
    end

  end

  describe "PATCH #update" do
    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "redirects to the login page" do
        post :create, goal: { name: "goal app",
                                  body: "finish goal app",
                                  user_id: 1,
                                  completed: false,
                                  deadline: 10.days.from_now,
                                  private: false }
        expect(response).to redirect_to(new_session_url)
      end
    end

    context "when logged in" do
      context "with valid params" do
        before(:each) { post :update, goal: { body: "finished" } }
        it "updates goal" do
          expect(goal.body).to eq("finished")
        end

        it "redirects to goal show page" do
          expect(path).to eq(goal_url(goal))
        end
      end

      context "with invalid params" do
        before(:each) { post :update, goal: { completed: "finished" } }

        it "flashes errors" do
          expect(flash[:errors]).to be_present
        end
      end
    end

  end

  describe "GET #show" do
    context "goal is private and user is not author" do
      before do
        allow(controller).to receive(:current_user) { unauthorized }
      end

      it "should not show goal" do
        expect(page).to_not have_content("goal app")
      end
    end

    context "goal is public" do
      before do
        allow(controller).to receive(:current_user) { unauthorized }
      end

      it "should show goal" do
        expect(page).to have_content("public goal app")
      end
    end
  end

  describe "DELETE #destroy" do
    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "redirects to the login page" do
        delete :destroy, id: goal.id
        expect(response).to redirect_to(new_session_url)
      end
    end


    context "when logged in" do
      context "when author of goal" do
        before do
          allow(controller).to receive(:current_user) { jack_bruce }
        end

        it "should be able delete goal" do
          delete :destroy, id: goal2.id
          expect(page).to_not have_content("public goal app")
        end
      end

      context "when not author of goal" do
        before do
          allow(controller).to receive(:current_user) { unauthorized }
        end

        it "should not be able to delete other goals" do
          delete :destroy, id: goal2.id
          expect(page).to have_content("public goal app")
        end
      end

    end
  end
end
