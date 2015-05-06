class AddSourceOtherToBrides < ActiveRecord::Migration
  def change
    add_column :brides, :source_other, :string
  end
end
