class RemoveValueFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :value, :integer
  end
end
