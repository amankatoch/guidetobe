require 'spec_helper'

describe ReviewsController do

  describe 'GET #new' do

    context "as a non registered user" do
      it "should redirect to the signup form" do
        get :new
        expect(response).to redirect_to signup_path
      end
    end

    context "as a signed in owner" do
      before :each do
        owner = create(:owner)
        session[:owner_id] = owner.id
      end

      it "should redirect to the root path" do
        get :new
        expect(response).to redirect_to regions_path
      end
    end

    context "as a signed in bride" do
      before :each do
        bride = create(:bride)
        session[:bride_id] = bride.id
      end

      it "should assign a new review to @review" do
        get :new
        expect(assigns(:review)).to be_a_new(Review)
      end

      it "should render the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end
  end

end
