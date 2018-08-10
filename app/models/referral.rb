require 'enums/event_type'

class Referral < ApplicationRecord
  belongs_to :contact

  validates_presence_of :name, :email

  after_create :award_referrer

  class_attribute :notifiers
  self.notifiers = [Notifiers::EventNotifier, Notifiers::SlackNotifier]

  DEFAULT_POINTS_AWARDED = 100
  private_constant :DEFAULT_POINTS_AWARDED

  private

  def award_referrer
    new_score = contact.points + DEFAULT_POINTS_AWARDED
    Contact.update(contact.id, points: new_score)

    notify_observers(build_event_message(contact_id: contact.id, new_score: new_score))
  end

  def build_event_message(contact_id:, new_score:)
    "Referral awarded to contact id: #{contact_id}. New score: #{new_score}"
  end

  def notify_observers(message)
    payload = {
      event_type: Enums::EventType::REFERRAL_AWARDED,
      points: DEFAULT_POINTS_AWARDED,
      descriptions: message
    }

    notifiers.each { |notifier| notifier.new.notify(payload: payload) }
  end
end
