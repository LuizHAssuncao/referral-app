require 'rails_helper'

RSpec.describe Contact, type: :model do
  context 'when checking contact relationships' do
    it { should have_many(:referrals).dependent(:destroy) }
  end

  context 'when validating contact fields' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end

  context 'when creating a contact' do
    it 'set points to 0 by default' do
      contact = FactoryBot.create(:contact)

      expect(contact.points).to be 0
    end
  end
end
