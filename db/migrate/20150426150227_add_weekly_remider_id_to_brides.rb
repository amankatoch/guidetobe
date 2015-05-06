class AddWeeklyRemiderIdToBrides < ActiveRecord::Migration
  def change
    add_column :brides, :weekly_reminder_id, :integer
  end
end
