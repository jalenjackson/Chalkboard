class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :meets, through: :taggings
end
