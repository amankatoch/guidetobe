class ChangeCityToRegionInWholeApp < ActiveRecord::Migration
  def change
  	rename_column :advertisements, :city_id, :region_id
  	rename_column :brides, :city, :region
  	rename_column :city_requests, :city, :region
  	rename_column :suppliers, :city_id, :region_id
  end
end
