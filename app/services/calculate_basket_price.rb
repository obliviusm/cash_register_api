class CalculateBasketPrice
  def initialize(product_codes)
    @product_codes = product_codes
  end

  def call
    return if unknown_product_code?

    product_groups = product_codes.tally.transform_keys { |code| Product.find_by(code: code) }
    product_groups.reduce(0) do |price, product_group|
      price + GetProductsPrice.new(product: product_group[0], count: product_group[1]).call
    end
  end

  private

  attr_reader :product_codes

  def unknown_product_code?
    product_codes.uniq.each do |product_code|
      return true unless Product.exists?(code: product_code)
    end
    false
  end
end
