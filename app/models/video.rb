class Video < ApplicationRecord
  is_impressionable
  acts_as_votable
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments

  # Paperclip attachments declaration
  has_attached_file :mp4,
                    :styles => {:thumb => ["400x400#", :jpg]}
  validates_attachment_content_type :mp4, content_type: /\Avideo/



  has_attached_file :image, styles: {medium: "300x300>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
