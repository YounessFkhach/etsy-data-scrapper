module Services
  class ConsumeListingFromJson
    def initialize(json)
      @hash = json.to_h
    end

    def call
      create_or_update_shop
      create_or_update_listing
      create_or_update_images
      create_or_update_tags

      @listing.images = @images
      @listing.tags = @tags
      @listing.save!

      true
    end

    private

    def create_or_update_shop
      @shop = Services::Shop::CreateOrUpdateShop.new(@hash['Shop']).call
    end

    def create_or_update_images
      @images = Services::Listing::CreateOrUpdateImages.new(@hash['Images'], @listing.id).call
    end

    def create_or_update_tags
      @tags = Services::Listing::CreateOrUpdateTags.new(@hash['tags']).call
    end

    def create_or_update_listing
      @listing = Services::Listing::CreateOrUpdateListing.new(@hash, @shop.id).call
    end
  end
end
