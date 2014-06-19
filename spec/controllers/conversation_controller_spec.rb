require 'spec_helper'

describe ConversationController do
  describe 'GET "index"' do
    it 'returns http success' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'GET "show"' do
    it 'returns http success' do
      email = create :email
      get :show, conversation_name: email.recipient.name.downcase
      expect(response).to be_success
    end
  end
end
