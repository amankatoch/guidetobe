class AddReviewCountToSuppliers < ActiveRecord::Migration
  def up
    add_column :suppliers, :reviews_count, :integer, default: 0, null: false

    Supplier.find_each(select: 'id') do |result|
      Supplier.reset_counters(result.id, :reviews)
    end
  end

  def down
    remove_column :suppliers, :reviews_count
  end
end
