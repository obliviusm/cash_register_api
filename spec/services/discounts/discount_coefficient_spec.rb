require 'rails_helper'

RSpec.describe Discounts::DiscountCoefficient do
  context "#call" do
    let(:product) { build :product, price: 1123 }

    context "buy 3+ and get it for 2/3 of original price" do
      let(:args) { ({ min_item: 3, k: (2.0 / 3) }) }

      it "gets price for 0" do
        result = described_class.new(product: product, count: 0, args: args).call
        expect(result).to eq 0
      end

      it "gets price for 1 without discount" do
        result = described_class.new(product: product, count: 1, args: args).call
        expect(result).to eq 1123
      end

      it "gets price for 3 with discount" do
        result = described_class.new(product: product, count: 3, args: args).call
        expect(result).to eq 2246
      end

      it "gets price for 4 without discount" do
        result = described_class.new(product: product, count: 4, args: args).call
        expect(result).to eq 2995
      end
    end
  end
end
