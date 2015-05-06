class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :general_content
      t.text :like_content
      t.text :unlike_content
      t.text :insider_tip
      t.integer :value
      t.integer :service
      t.integer :price
      t.integer :overall
      t.references :supplier, index: true

      t.timestamps
    end
  end
end
