 class Meet < ApplicationRecord

  acts_as_votable
  belongs_to :category
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  acts_as_taggable



  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :city
  validates_presence_of :state

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    [address1,address2,city,state,zipcode].join(', ')
  end

  has_attached_file :video,
                    :styles => {:thumb => ["400x400#", :jpg]}
  validates_attachment_content_type :video, content_type: /\Avideo/

  has_attached_file :image, styles: {medium: "600x600>",large:"1000x1000>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_attached_file :image2, styles: {large:"1000x1000>" }
  validates_attachment_content_type :image2, content_type: /\Aimage\/.*\z/

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
  end
  def self.search(params)
    meets = meets.where("name like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    meets = meets.near(params[:location], 20) if params[:location].present?
    meets
  end



  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(', ')
  end


end
