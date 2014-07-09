require 'spec_helper'

describe Recipient do
  it { should belong_to(:user) }

  it { should validate_presence_of(:email) }

  describe '.find_or_create_for_mandrill_event!' do
    it 'finds a preexisting recipient' do
      recipient = create :recipient
      found_recipient = Recipient.find_or_create_for_mandrill_event!(recipient.email, recipient.name)
      expect(found_recipient).to eq recipient
    end

    it 'creates a nonexisting recipient' do
      recipient = attributes_for :recipient
      created_recipient = Recipient.find_or_create_for_mandrill_event!(recipient[:email], recipient[:name])
      expect(created_recipient.email).to eq recipient[:email]
      expect(created_recipient.name).to eq recipient[:name]
    end
  end

  describe '#conversation_friendly_name' do
    let(:recipient) { create :recipient }

    it 'returns the first half of an email address' do
      expect(recipient.conversation_friendly_name).to eq 'cats'
    end
  end
end
