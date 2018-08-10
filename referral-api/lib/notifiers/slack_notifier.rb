require 'http'

module Notifiers
  class SlackNotifier
    def initialize(dependencies = {})
      @http_client = dependencies.fetch(:http_client, HTTP)
      @url = dependencies.fetch(:url, 'https://hooks.slack.com/services/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')
    end

    def notify(payload:)
      @http_client.post(@url, body: payload.descriptions)
    end
  end
end
