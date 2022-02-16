FactoryGirl.define do
  factory :order do
    customer "Jacky"

    factory :order_without_customer do
      customer nil
    end
  end
end
