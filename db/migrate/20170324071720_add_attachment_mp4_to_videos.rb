class AddAttachmentMp4ToVideos < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.attachment :mp4
    end
  end

  def self.down
    remove_attachment :videos, :mp4
  end
end
