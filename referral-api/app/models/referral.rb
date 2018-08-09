class Referral < ApplicationRecord
  belongs_to :contact

  validates_presence_of :name, :email

  after_create :award_referrer

  private

  DEFAULT_POINTS_AWARD = 100

  def award_referrer
    new_score = contact.points + DEFAULT_POINTS_AWARD
    Contact.update(contact.id, points: new_score)
  end
end
