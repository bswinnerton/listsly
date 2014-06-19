# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :email do
    conversation
    sender
    recipient
    text_value 'I love cats'
    html_value '<h1>I LOVE CATS</h1>'
  end
end
