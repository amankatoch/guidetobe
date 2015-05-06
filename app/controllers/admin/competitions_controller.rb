class Admin::CompetitionsController < ApplicationController
  before_action :authenticate_admin
  layout 'admin_application'

  def show
    @brides = Bride.eligible_for_competition
  end

end
