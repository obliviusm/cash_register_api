class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.all.map{ |product| ProductPresenter.new(product) }
  end
end
