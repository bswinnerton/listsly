require 'spec_helper'

describe DigesterController do

  describe 'GET "email"' do
    it 'returns http success' do
      get :email
      expect(response).to be_success
    end
  end

end
