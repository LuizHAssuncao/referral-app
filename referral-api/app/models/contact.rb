class Contact < ApplicationRecord
  has_many :referrals, dependent: :destroy

  validates_presence_of :name, :email

  before_create :default_values

  private

  def default_values
    self.points ||= 0
  end
end
