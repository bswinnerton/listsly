require 'spec_helper'

describe ConversationHelper do

  describe '#conversation_friendly_date' do
    let(:post) { double(received_at: '2014-07-04 10:55:00 -0400'.to_datetime) }

    it 'returns a human readable date format' do
      expect(conversation_friendly_date(post)).to eq 'July 4th 2014 at 10:55AM'
    end
  end

  describe '#gravatar_image_tag' do
    let(:sender) { double(gravatar_email_hash: double) }

    context 'with no options' do
      it 'returns an image tag for the gravatar of the user' do
        expect(gravatar_image_tag(sender)).to eq "<img alt=\"Gravatar Image\" class=\"img-circle\" src=\"http://www.gravatar.com/avatar/#{sender.gravatar_email_hash}?d=blank\" />"
      end
    end

    context 'with size option' do
      it 'returns a small image tag for the gravatar of the user' do
        expect(gravatar_image_tag(sender, size: :small)).to eq "<img alt=\"Gravatar Image\" class=\"img-circle\" src=\"http://www.gravatar.com/avatar/#{sender.gravatar_email_hash}?s=20&amp;d=blank\" />"
      end
    end
  end

end
