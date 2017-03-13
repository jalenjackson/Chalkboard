class AddAttachmentDocumentToPins < ActiveRecord::Migration
  def self.up
    change_table :pins do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :pins, :document
  end
end
