require 'rails_helper'

RSpec.describe 'Leaderboard API', type: :request do
  describe 'GET /leaderboard' do
    it 'returns leaderboard' do
      contact1 = create_contact_with(referrals: 1)
      contact2 = create_contact_with(referrals: 2)
      contact3 = create_contact_with(referrals: 3)

      get '/leaderboard'

      result_order = json.map { |contact| contact['id'] }
      expect(result_order).to contain_exactly(contact3.id, contact2.id, contact1.id)
      expect(result_order.size).to eq(3)
    end

    it 'returns status code 200' do
      get '/leaderboard'

      expect(response).to have_http_status(200)
    end
  end

  def create_contact_with(referrals:)
    create(:contact_with_referrals, referrals_count: referrals)
  end
end
