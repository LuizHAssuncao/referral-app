require 'rails_helper'

RSpec.describe Referral, type: :model do
  context 'when checking referral relationships' do
    it { should belong_to(:contact) }
  end

  context 'when validating referral fields' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
end
