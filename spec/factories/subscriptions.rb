FactoryBot.define do
  factory :subscription do
    title { tea.title }
    price { Faker::Commerce.price(range: 5..20.0) }
    frequency { [7, 14, 21, 28].sample }
    tea
  end
end
