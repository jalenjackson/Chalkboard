class AddUserIdToMeets < ActiveRecord::Migration[5.0]
  def change
    add_column :meets, :user_id, :integer
    add_index :meets, :user_id
  end
end
