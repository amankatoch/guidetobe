class AddRatingToSupplier < ActiveRecord::Migration
  def change
    add_column :suppliers, :rating, :float, default: 0
  end
end
