# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :conversation do
    sequence :id
    name 'Cats'
  end
end
