class AddAvatarToBrides < ActiveRecord::Migration
  def change
    add_column :brides, :avatar, :string
  end
end
