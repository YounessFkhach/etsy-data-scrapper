class AddShopAssocitationToListing < ActiveRecord::Migration[6.1]
  def change
    add_reference :listings, :shop, foreign_key: { to_table: :shops }
  end
end
