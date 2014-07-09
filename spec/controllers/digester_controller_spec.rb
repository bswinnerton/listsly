require 'spec_helper'

describe DigesterController do
  describe 'POST "email"' do
    let(:mandrill_response) { MANDRILL_RESPONSE.to_json }

    it 'returns 404 if mandrill_events is not in params' do
      post :email
      expect(response.status).to eq 404
    end

    it 'returns 200 if mandrill_events is in params' do
      post :email, mandrill_events: mandrill_response
      expect(response).to be_success
    end
  end
end
