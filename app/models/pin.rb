class Pin < ApplicationRecord
  acts_as_votable
  searchkick word_start: [:title, :description]




  after_create :run_encoders

  #searchable do
    #text :title
    #text :description
  #end



  belongs_to :user
  has_many :comments
  has_many :users, through: :comments
  has_many :notifications, dependent: :destroy


  has_attached_file :image, styles: {medium: "300x300>", large:"1000x1000>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_attached_file :document
  validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/pages application/vnd.openxmlformats-officedocument.wordprocessingml.document) }


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

  # We want video model always to have :video_file attachment

  # Publish video makes it available
  def publish!
    self.published = true
    save
  end

  # Increment likes counter
  def like!
    self.likes += 1
    save
  end

  # Decrease likes counter
  def dislike!
    self.likes -= 1
    save
  end

  # Checks if all formats are already encoded, the simplest way
  def all_formats_encoded?
    self.webm_file.path && self.mp4_file.path && self.ogg_file.path ? true : false
  end



  private

  def run_encoders
    #if video_file?
    #Mp4VideoEncoder.perform_async(self.id)
    #OgvVideoEncoder.perform_async(self.id)
    #WebmVideoEncoder.perform_async(self.id)
    #end
  end




end
