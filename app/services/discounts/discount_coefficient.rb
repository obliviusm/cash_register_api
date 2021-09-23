module Discounts
  class DiscountCoefficient
    def initialize(product:, count:, args:)
      @product = product
      @count = count
      @min_item = args[:min_item]
      @k = args[:k]
    end

    def call
      if count >= min_item
        (count * price * k).ceil(0)
      else
        count * price
      end
    end

    private

    attr_reader :product, :count, :min_item, :k
    delegate :price, to: :product
  end
end
