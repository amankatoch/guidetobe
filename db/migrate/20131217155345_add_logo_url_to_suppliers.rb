class AddLogoUrlToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :logo_url, :string
  end
end
