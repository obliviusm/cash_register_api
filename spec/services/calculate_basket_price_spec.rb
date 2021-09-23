require 'rails_helper'

RSpec.describe CalculateBasketPrice do
  context "#call" do
    setup do
      create :product, code: "GR1", price: 311
      create :product, code: "SR1", price: 500
      create :product, code: "CF1", price: 1123
    end

    it "calculates price for GR1,SR1,GR1,GR1,CF1 basket" do
      result = described_class.new(%w(GR1 SR1 GR1 GR1 CF1)).call
      expect(result).to eq(2245)
    end

    it "calculates price for GR1,GR1 basket" do
      result = described_class.new(%w(GR1 GR1)).call
      expect(result).to eq(311)
    end

    it "calculates price for SR1,SR1,GR1,SR1 basket" do
      result = described_class.new(%w(SR1 SR1 GR1 SR1)).call
      expect(result).to eq(1661)
    end

    it "calculates price for GR1,CF1,SR1,CF1,CF1 basket" do
      result = described_class.new(%w(GR1 CF1 SR1 CF1 CF1)).call
      expect(result).to eq(3057)
    end
  end
end
