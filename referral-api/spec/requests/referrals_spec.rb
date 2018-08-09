require 'rails_helper'

RSpec.describe 'referrals API' do
  let!(:contact) { create(:contact) }
  let!(:referrals) { create_list(:referral, 20, contact_id: contact.id) }
  let(:contact_id) { contact.id }
  let(:id) { referrals.first.id }

  describe 'GET /contacts/:contact_id/referrals' do
    context 'when contact exists' do
      it 'returns status code 200' do
        get "/contacts/#{contact_id}/referrals"

        expect(response).to have_http_status(200)
      end

      it 'returns all contact referrals' do
        get "/contacts/#{contact_id}/referrals"

        expect(json.size).to eq(20)
      end
    end

    context 'when contact does not exist' do
      let(:contact_id) { 123 }

      it 'returns status code 404' do
        get "/contacts/#{contact_id}/referrals"

        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        get "/contacts/#{contact_id}/referrals"

        expect(response.body).to match(/Couldn't find Contact/)
      end
    end
  end

  describe 'GET /contacts/:contact_id/referrals/:id' do
    context 'when contact referral exists' do
      it 'returns status code 200' do
        get "/contacts/#{contact_id}/referrals/#{id}"

        expect(response).to have_http_status(200)
      end

      it 'returns the referral' do
        get "/contacts/#{contact_id}/referrals/#{id}"

        expect(json['id']).to eq(id)
      end
    end

    context 'when contact referral does not exist' do
      let(:id) { 123 }

      it 'returns status code 404' do
        get "/contacts/#{contact_id}/referrals/#{id}"

        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        get "/contacts/#{contact_id}/referrals/#{id}"

        expect(response.body).to match(/Couldn't find Referral/)
      end
    end
  end

  describe 'POST /contacts/:contact_id/referrals' do
    context 'when request attributes are valid' do
      it 'returns status code 201' do
        post "/contacts/#{contact_id}/referrals", params: { name: 'Luiz', email: 'test@luiz.tech' }

        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/contacts/#{contact_id}/referrals", params: {} }

      it 'returns status code 422' do
        post "/contacts/#{contact_id}/referrals", params: {}

        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        post "/contacts/#{contact_id}/referrals", params: {}

        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /contacts/:contact_id/referrals/:id' do
    let(:valid_attributes) { { name: 'Mozart' } }


    context 'when referral exists' do
      it 'returns status code 204' do
        put "/contacts/#{contact_id}/referrals/#{id}", params: { name: "Lewis", email: "luiz@tech.com" }

        expect(response).to have_http_status(204)
      end

      it 'updates the referral' do
        put "/contacts/#{contact_id}/referrals/#{id}", params: { name: "Lewis", email: "luiz@tech.com" }

        updated_referral = Referral.find(id)
        expect(updated_referral.name).to match(/Lewis/)
      end
    end

    context 'when the referral does not exist' do
      let(:id) { 123 }

      it 'returns status code 404' do
        put "/contacts/#{contact_id}/referrals/#{id}", params: { name: "Lewis", email: "luiz@tech.com" }

        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        put "/contacts/#{contact_id}/referrals/#{id}", params: { name: "Lewis", email: "luiz@tech.com" }

        expect(response.body).to match(/Couldn't find Referral/)
      end
    end
  end

  describe 'DELETE /contacts/:id' do
    it 'returns status code 204' do
      delete "/contacts/#{contact_id}/referrals/#{id}"

      expect(response).to have_http_status(204)
    end
  end
end
