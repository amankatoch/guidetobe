class AddRemidersIdToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :reminder1_id, :integer
    add_column :owners, :reminder2_id, :integer
  end
end
