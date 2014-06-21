# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Bill catlover Gates'
    sequence email { |n| "bill-#{n}@microsoft.com" }
    password 'correcthorsebatterystaple'
    confirmed_at { Time.now }
  end
end
