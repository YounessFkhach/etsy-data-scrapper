class AddCreationTszToListing < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :creation_tsz, :integer
  end
end
