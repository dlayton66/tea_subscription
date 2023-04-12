class Api::V1::Customer::SubscriptionsController < ApplicationController
  def create
    customer = Customer.find(params[:customer_id])
    subscription = Subscription.find(params[:subscription_id])
    CustomerSubscription.create!(customer: customer, subscription: subscription)
    render json: SubscriptionSerializer.new(subscription)
  end

  def index
    customer = Customer.find(params[:customer_id])
    render json: SubscriptionSerializer.new(customer.subscriptions)
  end

  def destroy
  end
end
