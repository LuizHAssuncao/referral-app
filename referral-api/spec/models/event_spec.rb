require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'when validating event fields' do
    it { should validate_presence_of(:event_type) }
    it { should validate_presence_of(:points) }
    it { should validate_presence_of(:descriptions) }
  end
end
