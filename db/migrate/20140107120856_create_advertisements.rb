class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :contact_name
      t.string :contact_email
      t.belongs_to :city, index: true
      t.belongs_to :category, index: true
      t.date :start_date
      t.date :end_date
      t.string :image_url
      t.string :type
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
