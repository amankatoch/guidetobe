class AddIndexToUsernames < ActiveRecord::Migration
  def change
    add_index :brides, :username
    add_index :owners, :username
    add_index :admins, :username
  end
end
