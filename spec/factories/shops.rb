FactoryBot.define do
  factory :shop do
    etsy_id { rand(100) }
    name  { "Some Etsy Shop" }
  end
end
