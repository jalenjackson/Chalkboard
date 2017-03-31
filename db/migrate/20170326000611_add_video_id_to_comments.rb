class AddVideoIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :video_id, :integer
    add_index :comments, :video_id
  end
end
