require 'rails_helper'

RSpec.describe Referral, type: :model do
  it { should belong_to(:contact) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
end
