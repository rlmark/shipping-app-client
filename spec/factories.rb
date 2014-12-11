FactoryGirl.define do
  factory :order do
  end

  factory :product do
    name "Troll"
    description "MyText"
    weight 1.5
    price_cents 100
  end
end
