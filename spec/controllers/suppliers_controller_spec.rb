require 'spec_helper'

describe SuppliersController do

  describe "GET #new" do
    it "assigns a new supplier to @supplier" do
      get :new
      expect(assigns(:supplier)).to be_a_new(Supplier)
    end

    it "render the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end
end
