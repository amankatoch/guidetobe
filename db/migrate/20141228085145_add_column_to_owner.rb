class AddColumnToOwner < ActiveRecord::Migration
  def change
    add_column :owners, :source_other, :string
  end
end
