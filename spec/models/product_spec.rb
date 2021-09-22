require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { create(:product) }

  it { should validate_presence_of(:code) }
  it { should validate_presence_of(:name) }

  it { should validate_uniqueness_of(:code) }

  it { should allow_value(11.12).for(:price) }
  it { should_not allow_value('hi').for(:price) }
  it { should_not allow_value(nil).for(:price) }
  it { should_not allow_value(-5).for(:price) }
end
