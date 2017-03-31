class AddAttachmentImage2ToMeets < ActiveRecord::Migration
  def self.up
    change_table :meets do |t|
      t.attachment :image2
    end
  end

  def self.down
    remove_attachment :meets, :image2
  end
end
