# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipient do
    email 'cats@lists.ly'
    name 'Cats'
  end
end
