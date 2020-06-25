class Event < ApplicationRecord
  validates :name, :location, :description, presence: true
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :user_events
  has_many :attendees, through: :user_events, class_name: 'User', dependent: :destroy

end
