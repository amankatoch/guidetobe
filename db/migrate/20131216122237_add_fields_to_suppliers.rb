class AddFieldsToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :address, :text
    add_column :suppliers, :facebook_url, :string
    add_column :suppliers, :twitter_url, :string
    add_column :suppliers, :google_url, :string
    add_column :suppliers, :video_url, :string
  end
end
