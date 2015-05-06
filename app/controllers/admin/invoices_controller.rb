class Admin::InvoicesController < ApplicationController

  before_action :authenticate_admin
  before_action :set_ad, only: [:new, :create]
  layout 'admin_application'

  def new
    @invoice = @ad.invoices.new
  end

  def create
    @invoice = @ad.invoices.new(post_params)
    if @invoice.save
      redirect_to admin_advertisement_path(@ad), notice: 'Invoice sent'
    else
      render :new
    end
  end

  private

  def set_ad
    @ad = Advertisement.find(params[:advertisement_id])
  end

  def post_params
    params.require(:invoice).permit(:date, :reference, :email, :amount)
  end
end