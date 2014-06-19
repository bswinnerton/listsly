require 'spec_helper'

describe Sender do
  it { should belong_to(:user) }

  it { should validate_presence_of(:email) }
  describe '.find_or_create_for_mandrill_event!' do
    it 'finds a preexisting sender' do
      sender = create :sender
      found_sender = Sender.find_or_create_for_mandrill_event!(sender.email, sender.name)
      expect(found_sender).to eq sender
    end

    it 'creates a nonexisting sender' do
      sender = attributes_for :sender
      created_sender = Sender.find_or_create_for_mandrill_event!(sender[:email], sender[:name])
      expect(created_sender.email).to eq sender[:email]
      expect(created_sender.name).to eq sender[:name]
    end
  end
end
