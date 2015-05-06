class Admin::AdvertisementsController < ApplicationController

  before_action :authenticate_admin
  before_action :set_ad, only: [:show, :edit, :update, :destroy]
  layout 'admin_application'

  def index
    @ads = Advertisement.all
  end

  def show
    @ad = Advertisement.find(params[:id])
    @invoices = @ad.invoices
  end

  def new
    @ad = Advertisement.new
  end

  def edit
    @ad = Advertisement.find(params[:id])
  end

  def create
    @ad = Advertisement.new(post_params)
    if @ad.save
      redirect_to [:admin, @ad], notice: 'Advertisement was added'
    else
      flash.now.alert = 'Oops! There are some important details missing below.'
      render :new
    end
  end

  def update
    if @ad.update(post_params)
      redirect_to [:admin, @ad], notice: 'Advertisement updated successfully'
    else
      flash.now.alert = 'Oops! There are some important details missing below.'
      render :edit
    end
  end

  def destroy
    @ad.destroy
    redirect_to admin_advertisements_path, notice: 'Advertisement removed'
  end

  private

    def set_ad
      @ad = Advertisement.find(params[:id])
    end

  def post_params
      params.require(:advertisement).permit(:start_date, :end_date, :contact_name, :contact_email, :image_url, :region_id, :category_id, :active, :ad_type)
    end

end