class AddUserIdToClassrooms < ActiveRecord::Migration[5.0]
  def change
    add_column :classrooms, :user_id, :integer
    add_index :classrooms, :user_id
  end
end
