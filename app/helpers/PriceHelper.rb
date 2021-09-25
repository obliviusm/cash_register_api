module PriceHelper
  def format_price(price)
    number_to_currency(price / 100.0, unit: "€", format: "%n %u")
  end
end
