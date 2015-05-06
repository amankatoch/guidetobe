class AddIndexToBridesEmail < ActiveRecord::Migration
  def change
    add_index :brides, :email, unique: true
  end
end
