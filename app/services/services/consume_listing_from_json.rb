module Services
  class ConsumeListingFromJson
    def initialize(json)
      @hash = json.to_h
    end

    #def call
    #  create_or_update_shop
    #  create_or_update_images
    #  create_or_update_tags
    #  create_or_update_listing

    #  true
    #end

    #private

    #def create_or_update_shop
    #  @shop = Services::Shop::CreateOrUpdateShop.new(hash['shop']).call
    #end

    #def create_or_update_images
    #  @images = Services::Listing::CreateOrUpdateImages.new(hash['images']).call
    #end

    #def create_or_update_tags
    #  @tags = Services::Listing::CreateOrUpdateTags.new(hash['tags']).call
    #end

    #def create_or_update_listing
    #  Services::Listing::CreateOrUpdateListing.new(hash, images: images, shop: shop, tags).call
    #end
  end
end
