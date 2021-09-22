class Product < ApplicationRecord
  validates_presence_of :code, :name, :price
  validates_uniqueness_of :code
  validates_numericality_of :price, :greater_than_or_equal_to => 0
end
