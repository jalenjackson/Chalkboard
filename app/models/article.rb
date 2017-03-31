class Article < ApplicationRecord
  is_impressionable
  acts_as_votable
  belongs_to :user

  has_attached_file :document
  validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/pages application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

  has_attached_file :image, styles: {medium: "300x300>", large:"1000x1000>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
