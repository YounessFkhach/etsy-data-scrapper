class AddIndexesToListings < ActiveRecord::Migration[6.1]
  def change
    add_index :listings, :views
    add_index :listings, :state
    add_index :listings, :creation_datetime
  end
end
