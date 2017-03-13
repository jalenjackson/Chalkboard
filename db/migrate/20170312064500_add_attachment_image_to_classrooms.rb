class AddAttachmentImageToClassrooms < ActiveRecord::Migration
  def self.up
    change_table :classrooms do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :classrooms, :image
  end
end
