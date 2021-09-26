class Product < ApplicationRecord
  validates_presence_of :code, :name, :price
  validates_uniqueness_of :code
  validates_numericality_of :price, :greater_than_or_equal_to => 0

  DISCOUNT_HANDLERS = {
    (GET_FREE = :get_free) => Discounts::GetFree,
    (DISCOUNT_NEW_PRICE = :discount_new_price) => Discounts::DiscountNewPrice,
    (DISCOUNT_COEFFICIENT = :discount_coefficient) => Discounts::DiscountCoefficient,
  }

  # can be saved to products in database as json column
  def discount_strategy
    case code
    when "GR1"
      { type: GET_FREE, args: { buy: 1, free: 1 } }
    when "SR1"
      { type: DISCOUNT_NEW_PRICE, args: { min_item: 3, new_price: 450 } }
    when "CF1"
      { type: DISCOUNT_COEFFICIENT, args: { min_item: 3, k: (2.0 / 3) } }
    end
  end
end
