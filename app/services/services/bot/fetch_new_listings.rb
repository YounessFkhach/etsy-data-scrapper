module Services
  module Bot
    class FetchNewListings
      include HTTParty
      base_uri 'openapi.etsy.com/v2'

      def initialize(page)
        @page = page
      end

      def call
        json = self.class.get("/listings/active", query: options, timeout: 300).body

        JSON.parse(json)
      rescue
        call
      end

      private

      def etsy_api_key
        ENV.fetch('ETSY_API_KEY')
      end

      def options
        {
          'api_key':  etsy_api_key,
          'includes': 'Images,Shop',
          'page': @page,
          'limit': 300
        }
      end
    end
  end
end
