class AddAttachmentMp3ToPodcasts < ActiveRecord::Migration
  def self.up
    change_table :podcasts do |t|
      t.attachment :mp3
    end
  end

  def self.down
    remove_attachment :podcasts, :mp3
  end
end
