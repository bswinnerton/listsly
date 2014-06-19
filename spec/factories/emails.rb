# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :email do
    conversation
    sender
    recipient

    factory :text_email do
      text_value 'I love cats'
    end

    factory :html_email do
      html_value '<h1>I LOVE CATS</h1>'
    end
  end
end
