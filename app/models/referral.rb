class Referral < ApplicationRecord
  belongs_to :contact

  validates_presence_of :name, :email

  after_create :award_referrer

  class_attribute :notifiers
  self.notifiers = [Notifiers::EventNotifier, Notifiers::SlackNotifier]

  private

  DEFAULT_POINTS_AWARDED = 100

  def award_referrer
    new_score = contact.points + DEFAULT_POINTS_AWARDED
    Contact.update(contact.id, points: new_score)

    payload = {
      event_type: Enums::EventType::REFERRAL_AWARDED,
      points: DEFAULT_POINTS_AWARDED,
      descriptions: build_event_message(contact_id: contact_id, new_score: new_score)
    }
    notify_observers(payload)
  end

  def build_event_message(contact_id:, new_score:)
    "Referral awarded to contact id: #{contact_id}. New score: #{new_score}"
  end

  def notify_observers(payload)
    self.notifiers.each { |notifier| notifier.new.notify(payload: payload) }
  end
end
