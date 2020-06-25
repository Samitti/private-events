class UserEvent < ApplicationRecord
  belongs_to :attendee, class_name: 'User', foreign_key: 'user_id'
  belongs_to :attended_event, class_name: 'Event', foreign_key: 'event_id'

  def self.join_event(user_id, event_id)
    create(user_id: user_id, event_id: event_id)
  end
end
