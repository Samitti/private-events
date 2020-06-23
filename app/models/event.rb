class Event < ApplicationRecord
  validates :name, :location, :description, presence: true
  belongs_to :user
end
