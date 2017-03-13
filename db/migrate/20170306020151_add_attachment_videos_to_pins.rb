class AddAttachmentVideosToPins < ActiveRecord::Migration
  def self.up
    change_table :pins do |t|
      t.attachment :video_file
      t.attachment :mp4_file
      t.attachment :webm_file
      t.attachment :ogg_file
      t.attachment :thumbnail
      t.boolean :published
      t.integer :likes, default: 0
    end
  end

  def self.down
    remove_attachment :pins, :video_file
    remove_attachment :pins, :mp4_file
    remove_attachment :pins, :webm_file
    remove_attachment :pins, :ogg_file
    remove_attachment :pins, :thumbnail
    remove_attachment :pins, :published
    remove_attachment :pins, :likes
  end
end
