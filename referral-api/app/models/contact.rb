class Contact < ApplicationRecord
  has_many :referrals, dependent: :destroy

  validates_presence_of :name, :email

  before_create :default_values

  def self.leaderboard
    left_joins(:referrals)
      .group(:id)
      .order('COUNT(referrals.id) DESC')
      .limit(20)
  end

  private

  def default_values
    self.points ||= 0
  end
end
