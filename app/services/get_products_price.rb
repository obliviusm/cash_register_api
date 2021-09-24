class GetProductsPrice
  def initialize(product:, count:)
    @product = product
    @count = count
  end

  def call
    if discount_strategy
      discount_service.new(product: product, count: count, args: discount_args).call
    else
      product.price * count
    end
  end

  private

  attr_reader :product, :count
  delegate :discount_strategy, to: :product

  def discount_service
    "Discounts::#{discount_strategy[:type].to_s.camelize}".constantize
  end

  def discount_args
    discount_strategy[:args]
  end
end
