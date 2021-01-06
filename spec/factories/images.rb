FactoryBot.define do
  factory :image do
    etsy_image_id { rand(100) }
    listing
  end
end
