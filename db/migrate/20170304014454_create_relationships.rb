class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.timestamps null:false
    end
    add_index :relationships, :follower_id
    add_index 
  end
end
