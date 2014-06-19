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
      get :show, conversation_name: :cats
      expect(response).to be_success
    end
  end
end
