class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :website
      t.references :city
      t.references :category

      t.timestamps
    end

    add_index :suppliers, :city_id
    add_index :suppliers, :category_id
  end
end
