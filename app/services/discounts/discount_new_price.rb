module Discounts
  class DiscountNewPrice
    def initialize(product:, count:, args:)
      @product = product
      @count = count
      @min_item = args[:min_item]
      @new_price = args[:new_price]
    end

    def call
      if count >= min_item
        count * new_price
      else
        count * price
      end
    end

    private

    attr_reader :product, :count, :min_item, :new_price
    delegate :price, to: :product
  end
end
