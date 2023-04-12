require 'rails_helper'

RSpec.describe 'Api::V1::Customer::Subscriptions', type: :request do
  let!(:customer) { create(:customer) }
  let!(:tea) { create(:tea) }
  let!(:subscription) { create(:subscription, tea: tea) }

  describe 'create customer subscription' do
    let!(:customer_subscription) { CustomerSubscription.last }
    before { post api_v1_customer_subscription_path(customer, subscription) }

    it 'is successful' do
      expect(response).to have_http_status(:success)
    end

    it 'joins customer to subscription' do
      expect(customer_subscription.customer).to eq(customer)
      expect(customer_subscription.subscription).to eq(subscription)
    end

    it 'defaults to active status' do
      expect(customer_subscription.status).to eq('active')
    end
  end

  describe 'get customer subscriptions' do
    let(:customer_subscriptions) { create_list(:customer_subscription, 10, customer: customer) }
    before { get api_v1_customer_subscription_path(customer) }

    it 'is successful' do
      expect(response).to have_http_status(:success)
    end

    it 'returns subscriptions' do

    end
  end

  describe 'GET /destroy' do
    xit 'returns http success' do
      get '/api/v1/subscriptions/destroy'
      expect(response).to have_http_status(:success)
    end
  end

end
