require 'rails_helper'

describe Services::ConsumeListingFromJson, type: :service do
  let :hash do
    JSON.load(File.read("spec/fixtures/listing.json"))
  end

  context 'when the listing do not already exist' do
    it 'creates the Listing' do
      expect do
        described_class.new(hash).call
      end.to change { Listing.count }.by(1)
         .and change { Shop.count }.by(1)
         .and change { Image.count }
         .and change { Tag.count }
    end
  end
end
