class Api::V1::Customers::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.create!(create_params)
    render json: SubscriptionSerializer.new(subscription)
  end

  def index
    customer = Customer.find(params[:customer_id])
    render json: SubscriptionSerializer.new(customer.subscriptions)
  end

  def update
    subscription = Subscription.find(params[:id])
    subscription.update!(update_params)
    render json: SubscriptionSerializer.new(subscription)
  end

  private
    def create_params
      params.permit(:customer_id, :tea_id, :price, :frequency)
    end

    def update_params
      params.permit(:status)
    end
end
