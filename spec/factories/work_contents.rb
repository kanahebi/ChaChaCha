FactoryBot.define do
  factory :work_content do
    client
    sequence(:name) { |n| "作業#{n}" }
    sequence(:name_kana) { |n| "サギョウ#{n}" }
  end
end
