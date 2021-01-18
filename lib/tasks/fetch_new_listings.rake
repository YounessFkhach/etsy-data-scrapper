namespace :listings do
  desc "Fetch new listings from Etsy API"
  task fetch_new: :environment do
    previous_listing_count = Listing.count
    previous_shop_count = Shop.count

    count = fetch_count
    limit = 100
    pages_count = (count / limit)

    puts "Fetching and Processing to process ##{count} listings"

    Parallel.map(1..pages_count, in_processes: 6) do |page|
      results = fetch_new_batch(page)

      # we got to the end of the list
      raise Parallel::Break if results.empty?

      process_batch(results, page)
    end

    new_listing_count = Listing.count
    new_shop_count = Shop.count

    puts "Done =============="
    puts "added ##{new_listing_count - previous_listing_count} new listings, total of #{new_listing_count}"
    puts "added ##{new_shop_count - previous_shop_count} new shops, total of #{new_shop_count}"
  end

  private

  def fetch_count
    hash = Services::Bot::FetchNewListings.new(1).call

    hash.fetch('count')
  end

  def fetch_new_batch(page = 1)
    puts "Fetching batch #{page}"

    hash = Services::Bot::FetchNewListings.new(page).call

    hash.fetch('results')
  end

  def process_batch(batch, page)
    puts "Processing batch #{page}"
    batch.each_with_index do |listing, index|
      Services::ConsumeListingFromJson.new(listing).call
    end
  end
end
