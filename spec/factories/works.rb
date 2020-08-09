FactoryBot.define do
  factory :work do
    user
    work_content
    work_property
    start_at { 3.hours.ago }
    end_at { 1.hours.ago }
  end
end
