require 'rails_helper'

RSpec.describe Referral, type: :model do
  context 'when checking referral relationships' do
    it { should belong_to(:contact) }
  end

  context 'when validating referral fields' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end

  context 'when creating a referral' do
    it 'awards referrer' do
      contact = FactoryBot.create(:contact)
      FactoryBot.create(:referral, contact_id: contact.id)
      FactoryBot.create(:referral, contact_id: contact.id)
      result = Contact.first

      expect(result.points).to eq 200
    end

    it 'records an referral_awarded event' do
      contact = FactoryBot.create(:contact)
      create(:referral, contact_id: contact.id, notifiers: [Notifiers::EventNotifier])
      create(:referral, contact_id: contact.id, notifiers: [Notifiers::EventNotifier])
      result = Event.last

      expect(result.points).to eq 100
      expect(result.descriptions).to eq "Referral awarded to contact id: #{contact.id}. New score: 200"
      expect(result.event_type).to eq 'referral_awarded'
    end
  end
end
