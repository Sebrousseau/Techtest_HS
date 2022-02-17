FactoryGirl.define do
  factory :order do
    sequence(:customer) { |i| "Jacky #{i}" }

    factory :order_without_customer do
      customer nil
    end
  end
end
