class User < ApplicationRecord
  has_many :events, foreign_key: 'user_id', dependent: :destroy
  has_many :user_events
  has_many :attended_events, through: :user_events, class_name: 'Event', dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
end
