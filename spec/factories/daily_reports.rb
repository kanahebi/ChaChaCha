FactoryBot.define do
  factory :daily_report do
    user
    date { Time.current }
    sequence(:memo) { |n| "memo#{n}" }
  end
end
