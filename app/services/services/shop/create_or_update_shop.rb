module Services
  module Shop
    class CreateOrUpdateShop
      def initialize(hash)
        @hash = hash
      end

      def call
        shop = ::Shop.find_or_create_by!(etsy_id: @hash['shop_id'])

        shop.update!(remaped_hash)

        shop
      end

      private

      def remaped_hash
        @hash.delete 'shop_id'
        @hash.delete 'user_id'
        @hash.delete 'is_vacation'
        @hash.delete 'vacation_message'
        @hash.delete 'sale_message'
        @hash.delete 'digital_sale_message'
        @hash.delete 'last_updated_tsz'
        @hash.delete 'listing_active_count'
        @hash.delete 'digital_listing_count'
        @hash.delete 'login_name'
        @hash.delete 'accepts_custom_requests'
        @hash.delete 'policy_welcome'
        @hash.delete 'policy_payment'
        @hash.delete 'policy_shipping'
        @hash.delete 'policy_refunds'
        @hash.delete 'policy_additional'
        @hash.delete 'policy_seller_info'
        @hash.delete 'policy_updated_tsz'
        @hash.delete 'policy_has_private_receipt_info'
        @hash.delete 'vacation_autoreply'
        @hash.delete 'upcoming_local_event_id'
        @hash.delete 'is_using_structured_policies'
        @hash.delete 'has_unstructured_policies'
        @hash.delete 'has_onboarded_structured_policies'
        @hash.delete 'include_dispute_form_link'
        @hash.delete 'is_direct_checkout_onboarded'
        @hash.delete 'policy_privacy'
        @hash.delete 'is_calculated_eligible'
        @hash.delete 'is_opted_in_to_buyer_promise'
        @hash.delete 'is_shop_us_based'
        @hash.delete 'custom_shops_state'
        @hash['name']              = @hash.delete 'shop_name'
        @hash['currency_unit']     = @hash.delete 'currency_code'
        @hash['image_url']         = @hash.delete 'image_url_760x100'
        @hash['icon_url']          = @hash.delete 'icon_url_fullxfull'
        @hash['creation_datetime'] = unix_epoch_to_timestamp(@hash.delete 'creation_tsz')

        @hash
      end

      def unix_epoch_to_timestamp(epoch)
        DateTime.strptime(epoch.to_s, '%s') unless epoch.nil?
      end
    end
  end
end

