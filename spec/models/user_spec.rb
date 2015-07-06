require 'rails_helper'

describe User do

  context 'when create without role' do
    let(:user) { create :without_role_user }
    it { expect(user.role).to eq UserRole::USER }
  end

end
