class ChangeTszColumnsToDateTime < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :creation_datetime, :timestamp
    add_column :listings, :state_datetime, :timestamp
    add_column :shops, :creation_datetime, :timestamp

    migrate_listing_data
    migrate_shop_data
  end

  def migrate_listing_data
    Listing.all.find_each do |listing|
      listing.update!(creation_datetime: unix_epoch_to_timestamp(listing.creation_tsz),
                      state_datetime:    unix_epoch_to_timestamp(listing.state_tsz))
    end
  end

  def migrate_shop_data
    Shop.all.find_each do |shop|
      shop.update!(creation_datetime: unix_epoch_to_timestamp(shop.creation_tsz))
    end
  end

  def unix_epoch_to_timestamp(epoch)
    DateTime.strptime(epoch.to_s, '%s') unless epoch.nil?
  end
end
