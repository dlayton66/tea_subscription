class Api::V1::Customer::SubscriptionsController < ApplicationController
  def create
    CustomerSubscription.create!(customer_id: params[:customer_id], subscription_id: params[:subscription_id])
    # Q: what json to render?
  end

  def index
  end

  def destroy
  end
end
