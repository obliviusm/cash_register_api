class Api::V1::BasketsController < ApplicationController
  def show
    @basket = {}
    @basket[:product_codes] = params[:product_codes]
    @basket[:price] = CalculateBasketPrice.new(@basket[:product_codes]).call

    unless @basket[:price]
      render json: { error: "At least one product code you provided is not valid" },
        status: :unprocessable_entity
    end
  end
end
