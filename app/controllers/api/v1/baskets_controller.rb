class Api::V1::BasketsController < ApplicationController
  api :GET, '/basket', 'Get basket with price'
  param :product_codes, Array, :desc => "Product codes in the basket", :required => true
  returns :code => 200, :desc => "a successful response" do
    property :basket, Hash, :desc => "Basket", :required => true do
      property :product_codes, Array, :desc => "Product codes in the basket"
      property :price, String, :desc => "Price in Euro like '3.11 €'"
    end
  end

  def show
    @basket = {}
    @basket[:product_codes] = params[:product_codes] || []
    @basket[:price] = CalculateBasketPrice.new(@basket[:product_codes]).call

    unless @basket[:price]
      render json: { error: "At least one product code you provided is not valid" },
        status: :unprocessable_entity
    end
  end
end
