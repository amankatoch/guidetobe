class CreateAdRequests < ActiveRecord::Migration
  def change
    create_table :ad_requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :supplier_name
      t.string :email
      t.string :phone
      t.string :contact_preference
      t.references :category, index: true

      t.timestamps
    end
  end
end
