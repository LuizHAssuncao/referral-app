require 'http'
require 'json'

module Notifiers
  class SlackNotifier
    def initialize(dependencies = {})
      @http_client = dependencies.fetch(:http_client, HTTP)
      @url = dependencies.fetch(:url, ENV['SLACK_WEBHOOK'])
    end

    def notify(payload:)
      content = { text: payload[:descriptions] }
      @http_client.post(@url, body: content.to_json)
    end
  end
end
