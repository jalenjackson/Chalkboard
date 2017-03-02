class Pin < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_many :comments

  searchable do
    text :title, :boost => 5
    text :description
  end



  has_attached_file :image, styles: {medium: "300x300>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
