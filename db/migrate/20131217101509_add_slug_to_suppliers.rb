class AddSlugToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :slug, :string
    add_index :suppliers, :slug, unique: true
  end
end
