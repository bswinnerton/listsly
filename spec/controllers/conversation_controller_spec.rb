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
      conversation = create :conversation
      get :show, conversation_name: conversation.name
      expect(response).to be_success
    end
  end
end
