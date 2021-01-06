module Services
  module Listing
    class CreateOrUpdateImages
      def initialize(hashArray, listing_id)
        @images_hash = hashArray
        @listing_id = listing_id
      end

      def call
        Image.create!(remaped_images_data)
      end

      private

      def remaped_images_data
        @images_hash.map do |image|
          {
            listing_id: @listing_id,
            etsy_image_id: image['listing_image_id'],
            url_full: image['url_fullxfull'],
            url_570_n: image['url_570xN'],
            url_75_75: image['url_75x75'],
            url_170_135: image['url_170x135'],
            hex_code: image['hex_code']
          }
        end
      end
    end
  end
end
