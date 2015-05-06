class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :body
      t.references :review, index: true
      t.references :owner, index: true
      t.boolean :hidden

      t.timestamps
    end
  end
end
