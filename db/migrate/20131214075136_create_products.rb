class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :year_price
      t.integer :month_price

      t.timestamps
    end
  end
end
