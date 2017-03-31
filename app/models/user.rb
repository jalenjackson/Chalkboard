class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:twitter]

  acts_as_messageable

  acts_as_voter

  validates_presence_of :username
  validates_presence_of :email

  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :themes
  validates_presence_of :occupation
  validates_presence_of :gender
  validates_uniqueness_of :username
  validates_uniqueness_of :email






  has_many :notifications, foreign_key: :recipient_id

  has_many :podcasts

  has_many :videos

  has_many :articles

  has_many :meets, dependent: :destroy

  has_many :active_relationships , class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :pins, dependent: :destroy

  has_many :events


  has_many :comments

  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users

  has_many :messages

  has_many :classrooms
  has_many :chatrooms

  mount_uploader :avatar , AvatarUploader

  has_attached_file :image, styles: {large: "1000x1000>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def mailboxer_email(object)
    return email
  end

  def follow(other)
    active_relationships.create(followed_id: other.id)
  end

  def unfollow(other)
    active_relationships.find_by(followed_id: other.id).destroy
  end

  def following?(other)
    following.include?(other)
  end



end
