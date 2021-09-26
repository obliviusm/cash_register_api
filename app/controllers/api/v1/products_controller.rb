class Api::V1::ProductsController < ApplicationController
  api :GET, '/products', 'Show list of all products'
  returns :code => 200, :desc => "a successful response" do
    param :products, Array, :desc => "Products array", :required => true do
      property :code, String, :desc => "Unique code like 'EP1'"
      property :name, String, :desc => "Name"
      property :price, String, :desc => "Price in Euro like '3.11 €'"
    end
  end

  def index
    @products = Product.all
  end
end
