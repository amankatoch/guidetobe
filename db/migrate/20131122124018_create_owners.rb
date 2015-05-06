class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.references :supplier, index: true

      t.timestamps
    end
  end
end
