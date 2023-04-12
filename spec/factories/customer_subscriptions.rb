FactoryBot.define do
  factory :customer_subscription do
    customer
    subscription
    status { [0,1].sample }
  end
end
