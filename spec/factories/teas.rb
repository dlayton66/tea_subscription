FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Lorem.sentence }
    temperature { Faker::Number.within(range: 140..212) }
    brew_time { [360, 420, 500, 560].sample }
  end
end
