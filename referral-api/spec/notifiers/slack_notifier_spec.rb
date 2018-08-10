require 'rails_helper'

RSpec.describe Notifiers::SlackNotifier, type: :notifiers do
  context 'when calling Slack notifier' do
    it 'sends a POST to Slack webhook' do
      payload = { descriptions: 'test' }
      http_client = spy(HTTP)
      url = 'www.test.com'
      subject = described_class.new(http_client: http_client, url: url)

      subject.notify(payload: payload)

      expect(http_client).to have_received(:post).with(url, body: payload[:descriptions])
    end
  end
end
