class RemoveMonthPricesFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :month_price
  end
end
