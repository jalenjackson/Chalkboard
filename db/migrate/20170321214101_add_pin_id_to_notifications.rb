class AddPinIdToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :pin_id, :integer
    add_index :notifications, :pin_id

  end
end
