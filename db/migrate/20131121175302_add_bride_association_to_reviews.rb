class AddBrideAssociationToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :bride, index: true
  end
end
