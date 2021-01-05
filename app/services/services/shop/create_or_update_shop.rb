module Services
  module Shop
    class CreateOrUpdateShop
      def initialize(hash)
        @hash = hash
      end

      def call
        shop = Shop.find_or_create_by!(etsy_id: @hash['shop_id'])

        shop.update!(remaped_hash)

        shop
      end

      private

      def remaped_hash
        @hash.delete 'shop_id'
        @hash['name']          = @hash.delete 'shop_name'
        @hash['currency_unit'] = @hash.delete 'currency_code'
        @hash['image_url']     = @hash.delete 'image_url_760x100'
        @hash['icon_url']      = @hash.delete 'icon_url_fullxfull'

        @hash
      end
    end
  end
end

