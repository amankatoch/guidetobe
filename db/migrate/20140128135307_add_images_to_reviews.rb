class AddImagesToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :image_one_url, :string
    add_column :reviews, :image_two_url, :string
    add_column :reviews, :image_three_url, :string
  end
end
