class EventsController < ApplicationController
  def index
    json_response(Event.all)
  end
end
