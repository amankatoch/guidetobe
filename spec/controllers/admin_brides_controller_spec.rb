require 'spec_helper'

describe Admin::BridesController do

  context 'no admin logged in' do
    describe 'GET #index' do
      it "should redirect to the admin login" do
        get :index
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end

  context "admin logged in" do
    before do
      session[:admin_id] = (create(:admin)).id
    end

    describe "GET #index" do
      before do
        @bride_1 = create(:bride)
        @bride_2 = create(:bride)
      end

      it "should assign brides to @brides" do
        get :index
        expect(assigns(:brides)).to eq Bride.all
      end

      it "should render :index" do
        get :index
        expect(response).to render_template :index
      end
    end

    describe "GET #show" do
      before do
        @bride = create(:bride)
        @review = create(:review, bride: @bride)
      end

      it "should assign the bride to @bride" do
        get :show, id: @bride.id
        expect(assigns(:bride)).to eq @bride
      end

      it "should assign reviews to @reviews" do
        get :show, id: @bride.id
        expect(assigns(:reviews)).to eq @bride.reviews
      end

      it "should render :show" do
        get :show, id: @bride.id
        expect(response).to render_template :show
      end
    end
  end
end