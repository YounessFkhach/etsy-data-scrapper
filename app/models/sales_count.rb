class SalesCount < ApplicationRecord
  belongs_to :listing
  after_save :update_listing_sales_count

  private

  def update_listing_sales_count
    listing.update(sales_count: count)
  end
end
