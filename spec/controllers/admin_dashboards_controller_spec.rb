require 'spec_helper'

describe Admin::DashboardsController do
  describe "GET :show" do
    context "with no admin" do
      it "should redirect to the admin login" do
        get :show
        expect(response).to redirect_to new_admin_session_path
      end
    end

    context "with admin" do
      before(:each) do
        admin = create(:admin)
        session[:admin_id] = admin.id
      end

      it "should render the :show template" do
        get :show
        expect(response).to render_template :show
      end
    end
  end
end
