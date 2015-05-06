class AddProductReferenceToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :product_id, :integer
    add_index :owners, :product_id
  end
end
