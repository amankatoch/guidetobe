class AddPlaceOfWeddingToBrides < ActiveRecord::Migration
  def change
    add_column :brides, :wedding_place, :string
  end
end
