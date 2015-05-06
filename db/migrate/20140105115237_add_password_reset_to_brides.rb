class AddPasswordResetToBrides < ActiveRecord::Migration
  def change
    add_column :brides, :password_reset_token, :string
    add_column :brides, :password_reset_sent_at, :datetime
  end
end