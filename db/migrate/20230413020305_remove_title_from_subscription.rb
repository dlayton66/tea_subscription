class RemoveTitleFromSubscription < ActiveRecord::Migration[7.0]
  def change
    remove_column :subscriptions, :title
  end
end
