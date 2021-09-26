require 'rails_helper'

describe "products' requests" do
  context 'GET /v1/products' do
    let!(:product) { create(:product, code: 'GF1', name: "Lame Lemon", price: 311) }
    let!(:other_products) { create_list(:product, 10) }

    before { get '/v1/products' }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns products' do
      body = JSON.parse(response.body)
      expect(body['products'].size).to eq(11)
      expect(body['products'][0]['code']).to eq('GF1')
      expect(body['products'][0]['name']).to eq('Lame Lemon')
      expect(body['products'][0]['price']).to eq('3.11 €')
    end
  end
end
