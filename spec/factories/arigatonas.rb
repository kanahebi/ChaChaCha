FactoryBot.define do
  factory :arigatona do
    daily_report
    user
    sequence(:comment) { |n| "comment#{n}" }
  end
end
