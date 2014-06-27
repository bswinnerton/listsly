# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Bill catlover Gates'
    sequence :email do |n| 
      "bill-#{n}@microsoft.com"
    end
    password 'correcthorsebatterystaple'
    confirmed_at { Time.now }
    is_admin false

    factory :admin do
      is_admin true
    end
  end
end
