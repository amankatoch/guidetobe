class AddLastLoginToBrides < ActiveRecord::Migration
  def change
    add_column :brides, :last_login, :datetime
    add_column :owners, :last_login, :datetime
  end
end
