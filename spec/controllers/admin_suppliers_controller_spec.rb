require 'spec_helper'

describe Admin::SuppliersController do

  context "no admin logged in" do
    describe "GET #index" do
      it "should redirect to the admin login" do
        get :index
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end

  context "admin logged in" do
    before(:each) do
      admin = create(:admin)
      session[:admin_id] = admin.id
    end

    describe "GET #index" do
      before(:each) do
        @supplier_1 = create(:supplier)
        @supplier_2 = create(:supplier)
      end

      it "should assign suppliers to @suppliers" do
        get :index
        expect(assigns(:suppliers)).to eq Supplier.all
      end
    end
  end

end