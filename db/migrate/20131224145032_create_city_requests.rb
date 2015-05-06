class CreateCityRequests < ActiveRecord::Migration
  def change
    create_table :city_requests do |t|
      t.string :city
      t.string :email
      t.date :wedding_date

      t.timestamps
    end
  end
end
