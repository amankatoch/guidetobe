class AddNewColumnToOwner < ActiveRecord::Migration
  def change
  	 add_column :owners, :source, :string
  end
end
