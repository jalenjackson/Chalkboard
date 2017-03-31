class AddAttachmentImageToChatrooms < ActiveRecord::Migration
  def self.up
    change_table :chatrooms do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :chatrooms, :image
  end
end
