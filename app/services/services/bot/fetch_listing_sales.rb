module Services
  module Bot
    class FetchListingSales
      def initialize(listing)
        @listing = listing
      end

      def call
        html = HTTParty.get(@listing.url, timeout: 300).body

        sales_count = html.match(/(\d*\.?\d+|\d{1,3}(,\d{3})*(\.\d+)?) sales/) { |m| m.captures }&.first&.to_i

        if sales_count
          SalesCount.create!(count: sales_count, listing_id: @listing.id)
        end
      rescue => _e
        puts "error on listing: #{@listing.id} #{@listing.url}"
      end
    end
  end
end
