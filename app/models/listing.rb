class Listing < ApplicationRecord
  belongs_to :shop
  has_many :images
  has_and_belongs_to_many :tags
end
