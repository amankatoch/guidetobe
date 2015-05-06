require 'spec_helper'

describe CategoriesController do

  describe "GET #show" do

    before(:each) do
      @region = create(:region)
      @category = create(:category)
    end

    it "assigns the correct category to @category" do
      get :show, region_id: @region, id: @category
      expect(assigns(:category)).to eq @category
    end

    it "assigns the correct region to @region" do
      get :show, region_id: @region, id: @category
      expect(assigns(:region)).to eq @region
    end

    it "renders the :show template" do
      get :show, region_id: @region, id: @category
      expect(response).to render_template :show
    end

  end
end
