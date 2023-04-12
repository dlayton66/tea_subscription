class CustomerSubscription < ApplicationRecord
  belongs_to :customer
  belongs_to :subscription

  attribute :status, default: 1
  enum status: [:cancelled, :active]
end
