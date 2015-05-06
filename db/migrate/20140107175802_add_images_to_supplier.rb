class AddImagesToSupplier < ActiveRecord::Migration
  def change
    add_column :suppliers, :image_one_url, :string
    add_column :suppliers, :image_two_url, :string
    add_column :suppliers, :image_three_url, :string
    add_column :suppliers, :image_four_url, :string
  end
end
