require 'spec_helper'

describe MandrillEvent do
  let(:email) { build :email }
  let(:response) do
    {"event"=>"inbound",
     "msg"=>
       {
         "from_email"=>email.sender.email,
         "from_name"=>email.sender.name,
         "email"=>email.recipient.email,
         "to"=>[[email.recipient.email, email.recipient.name]],
         "text"=>email.text_value,
         "html"=>email.html_value
       }
    }
  end

  it 'takes in a mandrill response and instantiates a new object' do
    expect(MandrillEvent.new(response)).to be_a MandrillEvent
  end
end
