class Api::V1::BasketsController < ApplicationController
  def show
    @basket = {}
    @basket[:product_codes] = params[:product_codes]
    @basket[:price] = CalculateBasketPrice.new(@basket[:product_codes]).call
  end
end
