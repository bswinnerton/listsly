# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sender do
    user
    email 'bill@microsoft.com'
    name 'Bill catlover Gates'
  end
end
