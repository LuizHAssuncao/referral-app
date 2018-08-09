require 'rails_helper'

RSpec.describe Contact, type: :model do
  context 'when checking contact relationships' do
    it { should have_many(:referrals).dependent(:destroy) }
  end

  context 'when validating contact fields' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
end
