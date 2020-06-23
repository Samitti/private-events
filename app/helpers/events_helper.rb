module EventsHelper

  def event_creator?
    current_user == @event.user
  end
  
end
