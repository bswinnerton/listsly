require 'spec_helper'

describe User do
  describe '#admin?' do
    context 'user' do
      let(:user) { create :user }

      it 'returns false if user does not have is_admin attribute' do
        expect(user.admin?).to eq false
      end
    end

    context 'admin' do
      let(:user) { create :admin }

      it 'returns false if user does not have is_admin attribute' do
        expect(user.admin?).to eq true
      end
      
    end
  end
end
