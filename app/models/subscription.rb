class Subscription < ApplicationRecord
  belongs_to :tea
  belongs_to :customer

  attribute :status, default: 1
  enum status: [:cancelled, :active]
end