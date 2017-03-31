class AddUserIdToPodcasts < ActiveRecord::Migration[5.0]
  def change
    add_column :podcasts, :user_id, :integer
    add_index :podcasts, :user_id
  end
end
