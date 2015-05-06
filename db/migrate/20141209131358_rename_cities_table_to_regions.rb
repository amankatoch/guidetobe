class RenameCitiesTableToRegions < ActiveRecord::Migration
  def change
  	rename_table :cities, :regions
  end
end
