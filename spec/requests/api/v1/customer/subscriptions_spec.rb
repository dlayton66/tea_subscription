require 'rails_helper'

RSpec.describe 'Api::V1::Customer::Subscriptions', type: :request do
  let!(:customer) { create(:customer) }
  let!(:subscription) { create(:subscription) }
  
  describe 'create customer subscription' do
    before { post api_v1_customer_subscription_path(customer, subscription) }
    let(:customer_subscription) { CustomerSubscription.last }

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

    it 'returns json of the subscription' do
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:data][:id]).to be_a(String)
      expect(parsed_response[:data][:type]).to eq('subscription')

      expect(parsed_response[:data][:attributes][:title]).to be_a(String)
      expect(parsed_response[:data][:attributes][:price].to_f).to be_a(Float)
      expect(parsed_response[:data][:attributes][:frequency]).to be_an(Integer)
    end
  end

  describe 'get customer subscriptions' do
    it 'returns subscriptions for a customer' do
      create_list(:customer_subscription, 10, customer: customer)
      get api_v1_customer_subscriptions_path(customer)

      expect(response).to have_http_status(:success)

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:data].count).to eq(10)

      parsed_response[:data].each do |subscription|
        expect(subscription[:id]).to be_a(String)
        expect(subscription[:type]).to eq('subscription')

        expect(subscription[:attributes][:title]).to be_a(String)
        expect(subscription[:attributes][:price].to_f).to be_a(Float)
        expect(subscription[:attributes][:frequency]).to be_an(Integer)
      end
    end
  end

  describe 'GET /destroy' do
    xit 'returns http success' do
      get '/api/v1/subscriptions/destroy'
      expect(response).to have_http_status(:success)
    end
  end

end
