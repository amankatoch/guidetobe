require 'spec_helper'

describe BridesController do

  describe "GET #new" do
    it "assigns a new Bride to @bride" do
      get :new
      expect(assigns(:bride)).to be_a_new(Bride)
    end
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do

    before :each do
      @bride = create(:bride)
    end

    context "with valid attributes" do
      it "saves a new bride to the database" do
        expect {
          post :create, bride: attributes_for(:bride)
          }.to change(Bride, :count).by(1)
      end

      it "redirect to the home page" do
        post :create, bride: attributes_for(:bride)
        expect(response).to redirect_to regions_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new bride to the database" do
        expect {
          post :create, bride: attributes_for(:invalid_bride)
        }.to_not change(Bride, :count)
      end

      it "re-renders the :new template" do
        post :create, bride: attributes_for(:invalid_bride)
        expect(response).to render_template :new
      end

    end
  end
end
