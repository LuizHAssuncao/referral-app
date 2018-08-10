require 'rails_helper'

RSpec.describe Notifiers::EventNotifier, type: :notifiers do
  context 'when calling event notifier' do
    it 'creates an event record' do
      payload = double('payload')
      event_model_class = spy(Event)
      subject = described_class.new(event_model_class: event_model_class)

      subject.notify(payload: payload)

      expect(event_model_class).to have_received(:create!).with(payload)
    end
  end
end
