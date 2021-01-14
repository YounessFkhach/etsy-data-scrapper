class RemoveTszColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :listings, :creation_tsz, :timestamp
    remove_column :listings, :state_tsz, :timestamp
    remove_column :shops, :creation_tsz, :timestamp
  end
end
