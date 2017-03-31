class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user


  has_attached_file :image, styles: {medium: "300x300>" , thumb: "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  # Paperclip attachments declaration
  has_attached_file :video_file
  has_attached_file :mp4_file
  has_attached_file :webm_file
  has_attached_file :ogg_file
  # Styles declaration makes paperclip to use imagemagick to resize image to given size
  has_attached_file :thumbnail, styles: { medium_nr: "250x150!" }

  # Paperclip requires to set attachment validators
  validates_attachment_content_type :video_file, content_type: /\Avideo/
  validates_attachment_content_type :mp4_file, content_type: /.*/
  validates_attachment_content_type :webm_file, content_type: /.*/
  validates_attachment_content_type :ogg_file, content_type: /.*/









end
