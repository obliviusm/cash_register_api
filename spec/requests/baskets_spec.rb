require 'rails_helper'

describe "baskets' requests" do
  context 'GET /v1/basket/:product_codes' do
    setup do
      create(:product, code: "GR1", name: "Green Tea", price: 311)
      create(:product, code: "SR1", name: "Strawberries", price: 500)
    end

    let(:product_codes) { ["GR1", "SR1", "GR1"] }

    before { get '/v1/basket', params: { product_codes: product_codes } }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns basket with price' do
      body = JSON.parse(response.body)
      expect(body['basket']['productCodes']).to eq(["GR1", "SR1", "GR1"])
      expect(body['basket']['price']).to eq('8.11 €')
    end
  end
end
