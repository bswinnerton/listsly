require 'spec_helper'

describe Sender do
  it { should belong_to(:user) }
  it { should validate_presence_of(:email) }

  describe '.find_or_create_for_mandrill_event!' do

    context 'user exists' do
      let(:sender) { create :sender }

      it 'finds a preexisting sender' do
        found_sender = Sender.find_or_create_for_mandrill_event!(sender.email, sender.name)
        expect(found_sender).to eq sender
      end
    end

    context 'new user' do
      let(:sender) { attributes_for :sender }

      it 'creates a nonexisting sender' do
        created_sender = Sender.find_or_create_for_mandrill_event!(sender[:email], sender[:name])
        expect(created_sender.email).to eq sender[:email]
        expect(created_sender.name).to eq sender[:name]
      end
    end

  end

  describe '#gravatar_email_hash' do
    let(:formatted_email) { 'bill@microsoft.com' }
    let(:sender) { create :sender, email: formatted_email }

    before do
      sender.stub_chain(:email, :downcase, :strip).and_return(formatted_email)
    end

    it "returns the MD5 digest of a user's stripped, downcased email" do
      expect(sender.gravatar_email_hash).to eq 'e22d1711f8e1b0f7b911f2086e33b51d'
    end
  end
end
