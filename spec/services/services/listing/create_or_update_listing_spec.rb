require 'rails_helper'

describe Services::Listing::CreateOrUpdateListing, type: :service do
  let :hash do
    JSON.load(File.read("spec/fixtures/listing.json"))
  end
  let!(:shop) { create(:shop, etsy_id: hash['Shop']['shop_id']) }

  context 'when the listing do not already exist' do
    it 'creates the Listing' do
      expect do
        described_class.new(hash, shop.id).call
      end.to change { Listing.count }.by(1)
    end
  end

  context 'when the listing already exists' do
    before do
      create(:listing, etsy_id: hash['listing_id'], shop_id: shop.id)
    end

    it 'creates the new images only' do
      expect do
        described_class.new(hash, shop.id).call
      end.not_to change { Image.count }
    end

    it 'returns all the images' do
      expect(described_class.new(hash, shop.id).call.title).to eq hash['title']
    end
  end
end
