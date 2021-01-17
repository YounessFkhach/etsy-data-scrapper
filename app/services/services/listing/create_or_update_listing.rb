module Services
  module Listing
    class CreateOrUpdateListing
      def initialize(hash, shop_id)
        @hash = hash
        @shop_id = shop_id
      end

      def call
        listing = ::Listing.find_by(etsy_id: @hash['listing_id'])

        if listing
          listing.update!(remaped_hash)
        else
          listing = ::Listing.create!(remaped_hash)
        end

        listing
      end

      private

      def remaped_hash
        {
          shop_id: @shop_id,
          etsy_id: @hash['listing_id'],
          state: @hash['state'],
          etsy_user_id: @hash['user_id'],
          title: @hash['title'],
          description: @hash['description'],
          price: @hash['price'],
          unit: @hash['currency_code'],
          quantity: @hash['quantity'],
          taxonomy_id: @hash['taxonomy_id'],
          suggested_taxonomy_id: @hash['suggested_taxonomy_id'],
          materials: @hash['materials'],
          shop_section_id: @hash['shop_section_id'],
          featured_rank: @hash['featured_rank'],
          creation_datetime: unix_epoch_to_timestamp(@hash['creation_tsz']),
          state_datetime: unix_epoch_to_timestamp(@hash['state_tsz']),
          url: @hash['url'],
          views: @hash['views'],
          num_favorers: @hash['num_favorers'],
          processing_min: @hash['processing_min'],
          processing_max: @hash['processing_max'],
          who_made: @hash['who_made'],
          is_supply: @hash['is_supply'],
          when_made: @hash['when_made'],
          item_weight: @hash['item_weight'],
          item_weight_unit: @hash['item_weight_unit'],
          item_length: @hash['item_length'],
          item_width: @hash['item_width'],
          item_height: @hash['item_height'],
          item_dimensions_unit: @hash['item_dimensions_unit'],
          is_private: @hash['is_private'],
          recipient: @hash['recipient'],
          occasion: @hash['occasion'],
          style: @hash['style'],
          non_taxable: @hash['non_taxable'],
          is_customizable: @hash['is_customizable'],
          is_digital: @hash['is_digital'],
          file_data: @hash['file_data'],
          has_variations: @hash['has_variations'],
          language: @hash['language']
        }
      end

      def unix_epoch_to_timestamp(epoch)
        DateTime.strptime(epoch.to_s, '%s') unless epoch.nil?
      end
    end
  end
end

