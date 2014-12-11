FactoryGirl.define do

  factory :line_item do
    product_id 1
    order_id 1
    total_cents 100
  end

  factory :order do
  end

  factory :product do
    name "Troll"
    description "MyText"
    weight 1.5
    price_cents 100
  end
end
