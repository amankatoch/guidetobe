class AddFormatToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :format, :string
  end
end
