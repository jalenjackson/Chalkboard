class Podcast < ApplicationRecord
  is_impressionable

  acts_as_votable

  belongs_to :user

  has_attached_file :image, styles: {medium: "1000x1000>" , thumb: "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_attached_file :mp3
  validates_attachment :mp3, :content_type => {:content_type => ["audio/mpeg", "audio/mp3"]}, :file_name => {:matches => [/mp3\Z/]}
  validates_presence_of :image, :mp3, :title, :description 

end
