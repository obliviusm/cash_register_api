FactoryBot.define do
  factory :product do
    sequence(:code) { |n| "ST#{n}" }
    sequence(:name) { |n| "Strong Tea #{n}" }
    price { 12.50 }
  end
end
