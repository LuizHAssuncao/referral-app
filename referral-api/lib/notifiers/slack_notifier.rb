require 'http'
require 'json'

module Notifiers
  class SlackNotifier
    def initialize(dependencies = {})
      @http_client = dependencies.fetch(:http_client, HTTP)
      @url = dependencies.fetch(:url, 'https://hooks.slack.com/services/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')
    end

    def notify(payload:)
      content = { text: payload[:descriptions] }
      @http_client.post(@url, body: content.to_json)
    end
  end
end
