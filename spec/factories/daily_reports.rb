FactoryBot.define do
  factory :daily_report do
    user
    sequence(:memo) { |n| "memo#{n}" }
end
