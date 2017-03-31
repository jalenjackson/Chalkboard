class AddAttachmentImageToMeets < ActiveRecord::Migration
  def self.up
    change_table :meets do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :meets, :image
  end
end
