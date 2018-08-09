class Referral < ApplicationRecord
  belongs_to :contact

  validates_presence_of :name, :email
end
