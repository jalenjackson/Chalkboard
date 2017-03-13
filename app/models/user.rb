class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_messageable

  has_many :notifications, foreign_key: :recipient_id

  has_many :pins, dependent: :destroy


  has_many :comments

  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users

  has_many :messages

  has_many :classrooms

  mount_uploader :avatar , AvatarUploader

  has_attached_file :image, styles: {large: "1000x1000>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def mailboxer_email(object)
    return email
  end



end
