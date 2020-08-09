FactoryBot.define do
  factory :client do
    sequence(:name) { |n| "クライアント#{n}" }
    sequence(:users_limit) { |n| n * 10 }
  end
end
