class Admin::DashboardsController < ApplicationController

  before_filter :authenticate_admin
  layout 'admin_application'

  def show
  	@bride = Bride.where("created_at >= ?", 1.week.ago.utc).count
  	@review = Review.where("created_at >= ?", 1.week.ago.utc).count
  	@supplier = Supplier.where("created_at >= ?", 1.week.ago.utc).count
    @owner = Owner.where(product_id: [1,2,3]).where("created_at >= ?", 1.week.ago.utc).count
    @premium = Owner.where(product_id: 1).where("created_at >= ?", 1.week.ago.utc).count
    @silver = Owner.where(product_id: 2).where("created_at >= ?", 1.week.ago.utc).count
    @gold = Owner.where(product_id: 3).where("created_at >= ?", 1.week.ago.utc).count

  	
  end

  def recent_brides
    
  end
end