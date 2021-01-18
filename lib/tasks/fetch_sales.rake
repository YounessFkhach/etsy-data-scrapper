namespace :listings do
  desc "Scraping sales counts from the web"
  task fetch_sales: :environment do
    Parallel.map(collection, in_processes: 4, progress: 'Fetching sales counts') do |listing|
      Services::Bot::FetchListingSales.new(listing).call
    end
  end

  private

  def collection
    Listing.active.viewed
  end
end
