class AddAttachmentVideoToMessages < ActiveRecord::Migration
  def self.up
    change_table :messages do |t|
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
    remove_attachment :messages, :video_file
    remove_attachment :messages, :mp4_file
    remove_attachment :messages, :webm_file
    remove_attachment :messages, :ogg_file
    remove_attachment :messages, :thumbnail
    remove_attachment :messages, :published
    remove_attachment :messages, :likes
  end
end
