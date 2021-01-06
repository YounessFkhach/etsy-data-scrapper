require 'rails_helper'

describe Services::Listing::CreateOrUpdateTags, type: :service do
  let :array do
    json = '[
      "first tags",
      "second tag",
      "third tag",
      "forth tag"
    ]'
    JSON.load(json)
  end

  context 'when there is no existing tag' do
    it 'creates all the tags' do
      expect do
        described_class.new(array).call
      end.to change { Tag.count }.by(array.size)
    end
  end

  context 'when there is an existing tag' do
    before do
      Tag.create!(name: 'second tag')
    end

    it 'creates only the non existing tags' do
      expect do
        described_class.new(array).call
      end.to change { Tag.count }.by(array.size - 1)
    end

    it 'returns all the tags' do
      expect(described_class.new(array).call.size).to eq array.size
    end
  end
end
