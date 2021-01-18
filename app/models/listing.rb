class Listing < ApplicationRecord
  belongs_to :shop
  has_many :images
  has_many :listing_tags
  has_many :tags, through: :listing_tags
  has_many :views_counts
  has_many :sales_counts

  scope :active, -> { where(state: 'active') }
  scope :viewed, -> { where('views > 0') }
end
