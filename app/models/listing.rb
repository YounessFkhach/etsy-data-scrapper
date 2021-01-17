class Listing < ApplicationRecord
  belongs_to :shop
  has_many :images
  has_many :listing_tags
  has_many :tags, through: :listing_tags

  scope :active, -> { where(state: 'active') }
end
