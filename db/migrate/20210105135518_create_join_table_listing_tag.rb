class CreateJoinTableListingTag < ActiveRecord::Migration[6.1]
  def change
    create_join_table :Listings, :Tags do |t|
      # t.index [:listing_id, :tag_id]
    end
  end
end
