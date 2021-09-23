require 'rails_helper'

RSpec.describe Discounts::DiscountNewPrice do
  context "#call" do
    let(:product) { build :product, price: 500 }

    context "buy 3+ and get new price 450" do
      let(:args) { ({ min_item: 3, new_price: 450 }) }

      it "gets price for 0" do
        result = described_class.new(product: product, count: 0, args: args).call
        expect(result).to eq 0
      end

      it "gets price for 1 without discount" do
        result = described_class.new(product: product, count: 1, args: args).call
        expect(result).to eq 500
      end

      it "gets price for 3 with discount" do
        result = described_class.new(product: product, count: 3, args: args).call
        expect(result).to eq 1350
      end

      it "gets price for 4 without discount" do
        result = described_class.new(product: product, count: 4, args: args).call
        expect(result).to eq 1800
      end
    end
  end
end
