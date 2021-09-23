module Discounts
  class GetFree
    def initialize(product:, count:, args:)
      @product = product
      @count = count
      @buy = args[:buy]
      @free = args[:free]
    end

    def call
      full_free = count / (buy + free)
      reminder = count % (buy + free)

      if reminder > buy
        (full_free + buy) * price
      else
        (full_free + reminder) * price
      end
    end

    private

    attr_reader :product, :count, :buy, :free
    delegate :price, to: :product
  end
end
