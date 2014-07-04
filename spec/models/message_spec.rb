require 'spec_helper'

describe Message do
  it { should belong_to(:conversation) }
  it { should belong_to(:sender) }
  it { should belong_to(:recipient) }

  it { should validate_presence_of(:conversation_id) }
  it { should validate_presence_of(:sender_id) }
  it { should validate_presence_of(:recipient_id) }
end
