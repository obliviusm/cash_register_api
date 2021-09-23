require 'rails_helper'

RSpec.describe Discounts::GetFree do
  context "#call" do
    let(:product) { build :product, price: 310 }

    context "buy 1 get 1 free" do
      let(:args) { ({ buy: 1, free: 1 }) }

      it "gets price for 0" do
        result = described_class.new(product: product, count: 0, args: args).call
        expect(result).to eq 0
      end

      it "gets price for 1" do
        result = described_class.new(product: product, count: 1, args: args).call
        expect(result).to eq 310
      end

      it "gets price for 4 (buy 2, free 2)" do
        result = described_class.new(product: product, count: 4, args: args).call
        expect(result).to eq 620
      end

      it "gets price for 5 (buy 3, free 2)" do
        result = described_class.new(product: product, count: 5, args: args).call
        expect(result).to eq 930
      end
    end
  end
end
