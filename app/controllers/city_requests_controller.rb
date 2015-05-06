class CityRequestsController < ApplicationController

  def new
    @city_request = CityRequest.new
  end

  def create
    @city_request = CityRequest.new(post_params)
    if @city_request.save
      redirect_to regions_path, notice: 'Thanks for giving us your details. We’ll be in touch when Guide To Be reaches you. Happy wedding planning'
    else
      flash.now.alert = 'Please make sure you fill in all the fields correctly'
      render :new
    end
  end

  private

    def post_params
      params.require(:city_request).permit(:region, :email, :wedding_date)
    end
end
