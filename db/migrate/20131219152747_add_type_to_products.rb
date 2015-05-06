class AddTypeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :package, :integer
  end
end
