require 'rails_helper'

RSpec.describe 'Api::V1::Customers::Subscriptions', type: :request do
  let!(:customer) { create(:customer) }
  let!(:tea) { create(:tea) }
  
  describe 'create customer subscription' do
    let!(:params) { { 
      tea_id: tea.id,
      price: 10.00,
      frequency: 14
    } }
    let(:subscription) { Subscription.last } # why can't this be lazily defined?
    before { post api_v1_customer_subscriptions_path(customer), params: params }

    it 'is successful' do
      expect(response).to have_http_status(:success)
    end

    it 'joins customer and tea to subscription' do
      expect(subscription.customer).to eq(customer)
      expect(subscription.tea).to eq(tea)
    end

    it 'defaults to active status' do
      expect(subscription.status).to eq('active')
    end

    it 'returns json of the subscription' do
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:data][:id]).to be_a(String)
      expect(parsed_response[:data][:type]).to eq('subscription')

      expect(parsed_response[:data][:attributes][:status]).to be_a(String)
      expect(parsed_response[:data][:attributes][:price].to_f).to be_a(Float)
      expect(parsed_response[:data][:attributes][:frequency]).to be_an(Integer)
      expect(parsed_response[:data][:attributes][:tea]).to eq(tea.title)
    end
  end

  describe 'index' do
    it 'returns subscriptions for a customer' do
      create_list(:subscription, 10, customer: customer)
      get api_v1_customer_subscriptions_path(customer)

      expect(response).to have_http_status(:success)

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:data].count).to eq(10)

      parsed_response[:data].each do |subscription|
        expect(subscription[:id]).to be_a(String)
        expect(subscription[:type]).to eq('subscription')

        expect(subscription[:attributes][:status]).to be_a(String)
        expect(subscription[:attributes][:price].to_f).to be_a(Float)
        expect(subscription[:attributes][:frequency]).to be_an(Integer)
        expect(subscription[:attributes][:tea]).to be_a(String)
      end
    end
  end

  describe 'update customer subscription' do
    it 'can change the status to cancelled' do
      subscription = create(:subscription, customer: customer, status: 'active')

      expect(Subscription.last.status).to eq('active')
      
      params = { status: 'cancelled' }
      patch api_v1_customer_subscription_path(customer, subscription), params: params
      
      expect(response).to have_http_status(:success)
      expect(Subscription.last.status).to eq('cancelled')
    end
  end

end
