class Product < ApplicationRecord
  validates_presence_of :code, :name, :price
  validates_uniqueness_of :code
  validates_numericality_of :price, :greater_than_or_equal_to => 0

  # can be saved to products in database as json column
  def discount_strategy
    case code
    when "GR1"
      { type: :get_free, args: { buy: 1, free: 1 } }
    when "SR1"
      { type: :discount_new_price, args: { min_item: 3, new_price: 450 } }
    when "CF1"
      { type: :discount_coefficient, args: { min_item: 3, k: (2.0 / 3) } }
    end
  end
end
