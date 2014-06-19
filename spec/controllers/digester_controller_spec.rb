require 'spec_helper'

describe DigesterController do
  describe 'POST "email"' do
    let(:sender_attributes) { attributes_for :sender }
    let(:recipient_attributes) { {name:'Cats', email: 'cats@lists.ly'} }
    let(:text) { 'I really like cats' }
    let(:html) { '<h1>I REALLY LIKE CATS</h1>' }
    let(:mandrill_response) do
      [{
        'event'=>'inbound',
        'msg' => {
          'from_email' => sender_attributes[:email],
          'from_name' => sender_attributes[:name],
          'email' => 'cats@lists.ly',
          'to' => [['cats@lists.ly', 'Cats']],
          'text' => text,
          'html' => html
        }
      }].to_json
    end

    it 'returns 404 if mandrill_events is not in params' do
      post :email
      expect(response.status).to eq 404
    end

    it 'returns 200 if mandrill_events is in params' do
      post :email, mandrill_events: mandrill_response
      expect(response).to be_success
    end

    context 'setters' do
      before :each do
        post :email, mandrill_events: mandrill_response
      end

      it 'sets the value of the conversation' do
        #TODO need a more authoritative source than not nil
        expect(Email.last.conversation).to_not be_nil
      end

      it 'sets the sender' do
        expect(Email.last.sender.email).to eq sender_attributes[:email]
        expect(Email.last.sender.name).to eq sender_attributes[:name]
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
  end
end
