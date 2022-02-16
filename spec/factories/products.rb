FactoryGirl.define do
  factory :product do
    sequence(:name) { |i| "Product #{i}" }
    unit_price_ht 1
    tva 0.2
  end
end
