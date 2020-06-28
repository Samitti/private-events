require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    # it "should validate presence of name" do
    #   user = User.new(name: 'Sami')
    #   expect(user.valid?).to be true
    # end

    it { should validate_presence_of(:name) }

    it 'should validate absence of name' do
      user = User.new(name: '')
      expect(user.valid?).to be false
    end
  end

  describe 'Associations' do
    it { should have_many(:created_events).class_name('Event').with_foreign_key(:user_id) }
    it { should have_many(:attended_events).through(:user_events) }
    it { should have_many(:user_events) }
  end
end
