FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "ユーザ#{n}" }
    password { 'password' }
    password_confirmation { 'password' }
    role { :client_admin }
  end

  trait :system_admin do
    role { :system_admin }
  end

  trait :client_admin do
    role { :client_admin }
  end

  trait :client_general do
    role { :client_general }
  end
end
