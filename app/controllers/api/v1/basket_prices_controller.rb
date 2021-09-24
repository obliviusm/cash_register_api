class Api::V1::BasketPricesController < ApplicationController
  def show
    @price = CalculateBasketPrice.new(params[:product_codes]).call
  end
end
