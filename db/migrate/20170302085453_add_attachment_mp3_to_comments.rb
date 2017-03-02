class AddAttachmentMp3ToComments < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|
      t.attachment :mp3
    end
  end

  def self.down
    remove_attachment :comments, :mp3
  end
end
