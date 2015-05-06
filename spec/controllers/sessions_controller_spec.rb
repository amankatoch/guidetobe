require 'spec_helper'

describe SessionsController do

  describe 'GET #new' do
    it "should render the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with a registered bride" do

      before(:each) do
        @bride = create(:bride, username: 'julie',
                               password: 'password', password_confirmation: 'password')
        post :create, username: 'julie', password: 'password'
      end

      it "should authenticate the bride" do
        expect(session[:bride_id]).to eq @bride.id
      end

      it "should redirect to the home page" do
        expect(response).to redirect_to regions_path
      end
    end

    context "with a owner" do
      before(:each) do
        @supplier = create(:supplier)
        @owner = create(:owner, username: 'john',
                               password: 'password', password_confirmation: 'password',
                               supplier: @supplier)
        post :create, username: 'john', password: 'password'
      end

      it "should authenticate the owner" do
        expect(session[:owner_id]).to eq @owner.id
      end

      it "should redirect to the home page" do
        expect(response).to redirect_to supplier_path(@supplier)
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @owner = create(:owner)
      session[:owner_id] = @owner.id
      delete :destroy
    end

    it "should destroy the session" do
      expect(session[:owner_id]).to be nil
    end

    it "should redirect to the root url" do
      expect(response).to redirect_to regions_path
    end
  end
end