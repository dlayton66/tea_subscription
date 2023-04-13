class Subscription < ApplicationRecord
  belongs_to :tea
  belongs_to :customer

  attribute :status, default: 1 # why does this show up as covered in unit tests?
  enum status: [:cancelled, :active]
end