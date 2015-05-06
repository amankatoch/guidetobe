class RemoveSlugIndexFromSuppliers < ActiveRecord::Migration
  def change
    remove_index :suppliers, :slug
  end
end
