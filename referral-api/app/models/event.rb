class Event < ApplicationRecord
  validates_presence_of :event_type, :points, :descriptions
end
