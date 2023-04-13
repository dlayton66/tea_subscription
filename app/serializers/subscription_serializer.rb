class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :price, :frequency, :status

  attribute :tea do |object|
    object.tea.title
  end
end
