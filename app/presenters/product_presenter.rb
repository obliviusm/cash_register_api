class ProductPresenter < SimpleDelegator
  include ActionView::Helpers

  def formatted_price
    number_to_currency(price / 100.0, unit: "€", format: "%n %u")
  end
end
