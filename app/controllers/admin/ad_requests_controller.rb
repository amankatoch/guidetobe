class Admin::AdRequestsController < ApplicationController

  before_action :authenticate_admin
  layout 'admin_application'

  def index
    @ad_requests = AdRequest.all
  end

end