class AdRequestsController < ApplicationController
  # no authentication

  def new
    @ad_request = AdRequest.new
  end

  def create
    @ad_request = AdRequest.new(post_params)
    if @ad_request.save
      redirect_to regions_path, notice: 'Thank you for your interest in placing an ad. We shall get back to you shortly'
    else
      flash.now.alert = 'Please make sure you fill in all the form fields'
      render :new
    end
  end

  private

    def post_params
      params.require(:ad_request).permit(:first_name, :last_name, :supplier_name, :email,
                                         :phone, :contact_preference, :category_id)
    end
end
