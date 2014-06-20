require 'spec_helper'

describe DigestionWorker, sidekiq: :fake do
  let(:sender_attributes) { attributes_for :sender }
  let(:recipient_attributes) { {name:'Cats', email: 'cats@lists.ly'} }
  let(:sender_email) { MANDRILL_RESPONSE.first['msg']['from_email'] }
  let(:sender_name) { MANDRILL_RESPONSE.first['msg']['from_name'] }
  let(:text) { MANDRILL_RESPONSE.first['msg']['text'] }
  let(:html) { MANDRILL_RESPONSE.first['msg']['html'] }
  let(:mandrill_response) { MANDRILL_RESPONSE.to_json }

  it 'rolls back the transaction if not successful'

  it 'sets the value of the conversation' do
    #TODO make test less brittle with mocks
    expect(Conversation.last.name).to eq recipient_attributes[:email].gsub(/^(.*)@.*/, '\1')
  end

  it 'sets the sender' do
    expect(Email.last.sender.email).to eq sender_email
    expect(Email.last.sender.name).to eq sender_name
  end

  it 'sets the recipient' do
    expect(Email.last.recipient.email).to eq recipient_attributes[:email]
    expect(Email.last.recipient.name).to eq recipient_attributes[:name]
  end

  it 'sets the value of the email' do
    expect(Email.last.text_value).to eq text
    expect(Email.last.html_value).to eq html
  end
end
