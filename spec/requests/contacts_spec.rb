require 'rails_helper'

RSpec.describe 'Contact API', type: :request do
  let!(:contacts) { create_list(:contact, 10) }
  let(:contact_id) { contacts.first.id }

  describe 'GET /contacts' do
    it 'returns contacts' do
      get '/contacts'

      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      get '/contacts'

      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /contacts/:id' do
    context 'when the record exists' do
      it 'returns the contact' do
        get "/contacts/#{contact_id}"

        expect(json).not_to be_empty
        expect(json['id']).to eq(contact_id)
      end

      it 'returns status code 200' do
        get "/contacts/#{contact_id}"

        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:invalid_contact_id) { 11 }

      it 'returns status code 404' do
        get "/contacts/#{invalid_contact_id}"

        expect(response).to have_http_status(404)
      end

      it 'returns a Not Found message' do
        get "/contacts/#{invalid_contact_id}"

        expect(response.body).to match(/Couldn't find Contact/)
      end
    end
  end

  describe 'POST /contacts' do
    let(:valid_attributes) { { name: "Luiz", email: "test@luiz.tech" } }

    context 'when the request is valid' do
      it 'creates a contact' do
        post '/contacts', params: valid_attributes

        expect(json['name']).to eq('Luiz')
        expect(json['email']).to eq('test@luiz.tech')
      end

      it 'returns status code 201' do
        post '/contacts', params: valid_attributes

        expect(response).to have_http_status(201)
      end
    end

    context 'when the email is empty' do
      it 'returns status code 422' do
        post '/contacts', params: { name: 'Luiz' }

        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        post '/contacts', params: { name: 'Luiz' }

        expect(response.body)
          .to match(/Validation failed: Email can't be blank/)
      end
    end

    context 'when the name is empty' do
      it 'returns status code 422' do
        post '/contacts', params: { email: 'test@luiz.tech' }

        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        post '/contacts', params: { email: 'test@luiz.tech' }

        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end

    describe 'PUT /contacts/:id' do
      context 'when the record exists' do
        it 'updates the record' do
          # CHECK: get id in database to check
          put "/contacts/#{contact_id}", params: { name: "Luiz Assuncao", email: 'test2@luiz.tech' }

          contact = Contact.find(contact_id)
          expect(response.body).to be_empty
          expect(contact.email).to eq 'test2@luiz.tech'
        end

        it 'returns status code 204' do
          put "/contacts/#{contact_id}", params: { name: "Luiz Assuncao", email: 'test2@luiz.tech' }

          expect(response).to have_http_status(204)
        end
      end
    end

    describe 'DELETE /contacts/:id' do
      it 'returns status code 204' do
        delete "/contacts/#{contact_id}"

        contact_existence = Contact.exists?(contact_id)
        expect(contact_existence).to be false
      end
    end
  end
end
