FactoryBot.define do
  factory :order do
    product { 1 }
    price { 1 }
    user { nil }
  end
end
