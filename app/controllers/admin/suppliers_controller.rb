class Admin::SuppliersController < ApplicationController

  layout 'admin_application'

  before_action :authenticate_admin
  before_action :set_supplier, only: [:edit, :update, :show, :destroy]

  def index
    @search    = Supplier.search(params[:q])
    @suppliers = @search.result.order(created_at: :desc)
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(post_params)
    if @supplier.save
      redirect_to new_admin_supplier_path, notice: 'Supplier added'
    else
      flash.now.alert = 'Oops! There are some important details missing below.'
      render :new
    end
  end

  def edit
  end

  def update
    if @supplier.update(post_params)
      redirect_to admin_supplier_path(@supplier), notice: 'Supplier updated successfully'
    else
      flash.now.alert = 'Oops! There are some important details missing below.'
      render :edit
    end
  end

  def show
  end

  def destroy
    @supplier.destroy
    redirect_to admin_suppliers_path, notice: 'Supplier removed'
  end

  def import_suppliers
    @search    = Supplier.search(params[:q])
    @suppliers = @search.result
    @errors_array = Supplier.import_suppliers(params[:file])

    if @errors_array.empty?
      redirect_to admin_suppliers_path, notice: 'Supplier imported successfully'
    else
      flash.now.alert = 'Oops! There are some important details missing below.'
      render :index
    end
  end

  private

    def post_params
      params.require(:supplier).permit(:name, :email, :phone, :website, :category_id, :region_id,
                                       :address, :facebook_url, :twitter_url, :google_url, :video_url,
                                       :logo_url, :description)
    end

    def set_supplier
      @supplier = Supplier.friendly.find(params[:id])
    end

end