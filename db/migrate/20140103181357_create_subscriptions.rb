class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.date :start_date
      t.date :end_date
      t.belongs_to :owner, index: true
      t.belongs_to :sale, index: true
      t.belongs_to :product, index: true

      t.timestamps
    end
  end
end
