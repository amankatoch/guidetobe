require 'spec_helper'

describe CitiesController do

  describe 'GET #index' do
    it "populates an array of all the regions" do
      region1 = create(:region)
      region2 = create(:region)
      get :index
      expect(assigns(:regions)).to match_array([region1, region2])
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "assigns requested region to @region" do
      region = create(:region)
      get :show, id: region
      expect(assigns(:region)).to eq region
    end

    it "renders the :show template" do
      region = create(:region)
      get :show, id: region
      expect(response).to render_template :show
    end

    it "assigns all categories to @categories" do
      region = create(:region)
      categories = create_list(:category, 5)
      get :show, id: region
      expect(assigns(:categories)).to eq categories
    end
  end

end
