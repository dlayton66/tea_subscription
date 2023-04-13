class AddStatusToSubscription < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :status, :integer
  end
end
