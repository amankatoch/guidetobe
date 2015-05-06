class Admin::CityRequestsController < ApplicationController

  before_action :authenticate_admin
  layout 'admin_application'

  def index
    @city_requests = CityRequest.all
  end


end