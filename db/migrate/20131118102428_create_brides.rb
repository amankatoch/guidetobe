class CreateBrides < ActiveRecord::Migration
  def change
    create_table :brides do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :postcode
      t.string :email
      t.integer :age
      t.string :source
      t.date :wedding_date
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
