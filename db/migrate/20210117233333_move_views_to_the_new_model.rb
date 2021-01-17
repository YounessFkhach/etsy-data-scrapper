class MoveViewsToTheNewModel < ActiveRecord::Migration[6.1]
  def change
    Listing.all.find_each do |listing|
      ViewsCount.create!(listing_id: listing.id, count: listing.views)
    end
  end
end
