class AddMeetIdToTaggings < ActiveRecord::Migration[5.0]
  def change
    add_column :taggings, :meet_id, :integer
    add_index :taggings, :meet_id
  end
end
