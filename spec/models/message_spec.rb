require 'spec_helper'

describe Message do
  it { should belong_to(:conversation) }
  it { should belong_to(:sender) }
  it { should belong_to(:recipient) }

  it { should validate_presence_of(:conversation_id) }
  it { should validate_presence_of(:sender_id) }
  it { should validate_presence_of(:recipient_id) }

  describe '#value' do
    it 'returns the html_value if exists' do
      email = create :html_email
      expect(email.value).to eq email.html_value.html_safe
    end

    it 'returns the text_value if exists and html_value does not' do
      email = create :text_email
      expect(email.value).to eq email.text_value
    end

    it 'returns "No posts" if none of the above conditions are true' do
      email = create :email
      expect(email.value).to eq nil
    end
  end
end
