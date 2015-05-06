class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.date :date
      t.string :reference
      t.string :email
      t.belongs_to :advertisement, index: true
      t.decimal :amount, precision: 8, scale: 2
      t.boolean :paid, default: false
      t.string :stripe_token

      t.timestamps
    end
  end
end
