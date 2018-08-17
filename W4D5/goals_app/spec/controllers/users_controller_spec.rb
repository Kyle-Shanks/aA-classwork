require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #show" do
    context 'if user is found' do
      let!(:user) { create :user }

      it "renders the show page" do
        get :show, params:{id: user.id}
        expect(response).to render_template :show
      end
    end

    context 'if user is not found' do

      it "redirects to the goals page" do
        get :show, params:{id: 100000}
        expect(response).to redirect_to goals_url
      end
    end
  end

  describe "GET #new" do
    it "renders the new user page" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do

    context "with valid credentials" do
      it 'redirects to the user page' do
        post :create, params: { user: { username: 'asdf', email: 'asdf@example.com', password: 'password' } }
        expect(response).to redirect_to(user_url(User.last))
      end
    end

    context "with invalid credentials" do
      before :each do
        post :create, params: { user: { password: 'pw' } }
      end

      it 'renders the sign up page' do
        expect(response).to have_http_status(422)
        expect(response).to render_template(:new)
      end

      it 'displays errors' do
        expect(flash[:errors]).to be_present
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:user) { create :user }
    before :each do
      delete :destroy, params:{id: user.id}
    end
    it "destroy the user" do
      expect(User.exists?(user.id)).to be false
    end
    it "redirects to the goals_url" do
      expect(response).to redirect_to(goals_url)
    end
  end

  describe "GET #edit" do
    let!(:user) { create :user }
    before :each do
      get :edit, params:{id: user.id}
    end

    it "finds the user" do
      expect(User.exists?(user.id)).to be true
    end

    it "renders the edit page" do
      expect(response).to render_template(:edit)
    end
  end

end
