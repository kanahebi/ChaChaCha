FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "ユーザ#{n}" }
    password { 'password' }
    password_confirmation { 'password' }
    role { :client_admin }
  end
end
