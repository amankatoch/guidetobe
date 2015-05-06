class AddNewSourceToSupplier < ActiveRecord::Migration
  def change
  	add_column :suppliers, :source_other, :string
  end
end
