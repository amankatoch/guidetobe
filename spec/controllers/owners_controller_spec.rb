require 'spec_helper'

describe OwnersController do

  describe "GET #new" do
    it "assigns a new Owner to @owner" do
      get :new
      expect(assigns(:owner)).to be_a_new(Owner)
    end
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  #describe "POST#create" do
  #  before :each do
  #    @supplier = create(:supplier)
  #    @product = create(:product)
  #  end
  #
  #  context "with valid attributes" do
  #    it "saves a new owner to the database" do
  #      expect {
  #        post :create, owner: attributes_for(:owner, supplier_id: @supplier.id, product_id: @product.id)
  #      }.to change(Owner, :count).by(1)
  #    end
  #
  #    it "redirects to the payments path" do
  #      post :create, owner: attributes_for(:owner, supplier_id: @supplier.id, product_id: @product.id)
  #      expect(response).to redirect_to edit_supplier_path(id: @supplier.id)
  #    end
  #  end
  #
  #  context "with invalid attributes" do
  #    it "does not save the new owner to the database" do
  #      expect {
  #        post :create, owner: attributes_for(:invalid_owner, supplier_id: @supplier.id, product_id: @product.id)
  #      }.to_not change(Owner, :count)
  #    end
  #
  #    it "re-renders the :new template" do
  #      post :create, owner: attributes_for(:invalid_owner, supplier_id: @supplier.id, product_id: @product.id)
  #      expect(response).to render_template :new
  #    end
  #
  #  end
  #end

end
