# spec/factories/products.rb
FactoryBot.define do
  factory :product do
    name { "Macbook" }
    price { 120000 }
    description { "New retina display screen" }
  end
end