class Contact < ApplicationRecord
  has_many :referrals, dependent: :destroy

  validates_presence_of :name, :email
end
