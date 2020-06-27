module EventsHelper
  def event_creator?
    current_user == @event.creator
  end

  def register_link(event_id: @event.id, user_id: current_user.id)
    if @current_attendee
      content_tag(:strong, "You have registered for this event")
    else
      link_to "Register for Event", event_join_path(event_id: @event.id, user_id: current_user.id), class: 'btn btn-secondary'
    end
  end
  
end
