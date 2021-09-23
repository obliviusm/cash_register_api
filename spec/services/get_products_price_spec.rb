require 'rails_helper'

RSpec.describe GetProductsPrice do
  context "#call" do
    context "when discount strategy" do
      let(:product) { build :product, code: "GR1", price: 311 }

      it "calculates discount price" do
        result = described_class.new(product: product, count: 2).call
        expect(result).to eq(311)
      end
    end

    context "when there is no strategy" do
      let(:product) { build :product, code: "GR2", price: 311 }

      it "calculates full price" do
        result = described_class.new(product: product, count: 2).call
        expect(result).to eq(622)
      end
    end
  end
end
