require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'Associations' do
    it { should belong_to(:creator).class_name('User').with_foreign_key(:user_id) }
    it { should have_many(:attendees).through(:user_events) }
    it { should have_many(:user_events) }
  end

  describe 'event scopes' do
    before(:example) do
      FactoryBot.create(:user)
      @past_event = FactoryBot.create(:event)
      @upcomming_event = FactoryBot.create(:event, name: 'event2', starts_at: '2030-06-26 16:43:35')
    end

    it 'returns only past event' do
      expect(Event.past).to include(@past_event)
      expect(Event.past).to_not include(@upcomming_event)
    end

    it 'returns only future event' do
      expect(Event.upcoming).to_not include(@past_event)
      expect(Event.upcoming).to include(@upcomming_event)
    end
  end
end
