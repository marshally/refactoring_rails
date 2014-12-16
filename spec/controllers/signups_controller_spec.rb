require 'rails_helper'

RSpec.describe SignupsController, :type => :controller do
  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      email: "marshall@codeclimate.com",
      login: "marshally",
    }
  }

  let(:invalid_attributes) {
    {
      email: nil,
      login: nil,
    }
  }

  let(:valid_session) { {} }

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new, {}, valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      let (:account_name) { "Code Climate" }
      let (:create_attributes) {
        valid_attributes.merge(account_name: account_name)
      }
      it "creates a new User" do
        expect {
          post :create, {:user => create_attributes}, valid_session
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {:user => create_attributes}, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "assigns a newly created account as @account" do
        post :create, {:user => create_attributes}, valid_session
        expect(assigns(:account)).to be_a(Account)
        expect(assigns(:account)).to be_persisted
        expect(assigns(:account).name).to eq(account_name)
      end

      it "redirects to the created user" do
        post :create, {:user => create_attributes}, valid_session
        expect(response).to redirect_to(User.last)
      end

      it "fails if account name is already take" do
        Account.create(name: account_name)
        post :create, {:user => create_attributes}, valid_session
        expect(assigns(:account)).to_not be_persisted
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

end
