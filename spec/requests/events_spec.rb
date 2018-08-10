require 'rails_helper'

RSpec.describe 'Events API', type: :request do
  describe 'GET /events' do
    it 'returns events' do
      create_contact_with(referrals: 2)

      get '/events'

      expect(json.size).to eq(2)
    end

    it 'returns status code 200' do
      get '/events'

      expect(response).to have_http_status(200)
    end
  end

  def create_contact_with(referrals:)
    contact = FactoryBot.create(:contact)
    create(:referral, contact_id: contact.id, notifiers: [Notifiers::EventNotifier])
    create(:referral, contact_id: contact.id, notifiers: [Notifiers::EventNotifier])
  end
end
