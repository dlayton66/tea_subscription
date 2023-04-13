FactoryBot.define do
  factory :subscription do
    status { [0,1].sample }
    price { Faker::Commerce.price(range: 5..20.0) }
    frequency { [7, 14, 21, 28].sample }
    tea
    customer
  end
end
