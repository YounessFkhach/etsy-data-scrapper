FactoryBot.define do
  factory :listing do
    etsy_id { rand(100) }
    title  { "some listing title" }
    shop
  end
end
