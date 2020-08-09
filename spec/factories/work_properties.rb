FactoryBot.define do
  factory :work_property do
    client
    sequence(:name) { |n| "作業#{n}" }
    sequence(:code) { |n| "A1-00#{n}" }
  end
end
