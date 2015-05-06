require 'spec_helper'

describe Admin::SessionsController do

  describe "GET #new" do
    it "should render the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with a valid admin" do
      before(:each) do
        @admin = create(:admin, username: 'test', password: 'password', password_confirmation: 'password')
        post :create, username: 'test', password: 'password'
      end

      it "should redirect to the admin dashboard on login" do
        expect(response).to redirect_to admin_dashboard_path
      end

      it "should add the admin to a session" do
        expect(session[:admin_id]).to eq @admin.id
      end
    end

    context "with an invalid admin" do
      before(:each) do
        @admin = create(:admin, username: 'test', password: 'password', password_confirmation: 'password')
        post :create, username: 'test', password: 'garbage'
      end

      it "should render the :new template" do
        expect(response).to render_template :new
      end

      it "should not add the admin to a session" do
        expect(session[:admin_id]).to be_nil
      end
    end
  end
end