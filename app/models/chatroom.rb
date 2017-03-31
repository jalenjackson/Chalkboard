class Chatroom < ApplicationRecord
  has_many :chatroom_users
  has_many :users, through: :chatroom_users
  has_many :messages
  belongs_to :user

  has_attached_file :image, styles: {medium: "300x300>", large:"1000x1000>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  #searchable do
    #text :name
  #end

end
