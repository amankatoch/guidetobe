class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin

  layout 'admin_application'

  def index
    @products = Product.order(:package)
  end

  def show
    @owners = @product.owners
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_url(@product), notice: 'Product was successfully created.' }
      else
        format.html { render 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_product_url(@product), notice: 'Product was successfully updated.' }
      else
        format.html { render 'edit' }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :month_price, :year_price, :package)
    end
end
