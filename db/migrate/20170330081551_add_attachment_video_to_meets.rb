class AddAttachmentVideoToMeets < ActiveRecord::Migration
  def self.up
    change_table :meets do |t|
      t.attachment :video
    end
  end

  def self.down
    remove_attachment :meets, :video
  end
end
