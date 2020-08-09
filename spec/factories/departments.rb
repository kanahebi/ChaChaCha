FactoryBot.define do
  factory :department do
    client
    sequence(:name) { |n| "部署#{n}" }
  end
end
