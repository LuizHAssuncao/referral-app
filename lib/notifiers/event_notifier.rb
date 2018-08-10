module Notifiers
  class EventNotifier
    def initialize(dependencies = {})
      @event_model_class = dependencies.fetch(:event_model_class, Event)
    end

    def notify(payload:)
      @event_model_class.create!(payload)
    end
  end
end
