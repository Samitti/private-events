class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = current_user.events.build
  end

  def create 
    @event = current_user.events.build(event_params)
    if @event.save 
      redirect_to @event, notice: 'Event created'
    else
      render :new 
    end
  end

  def edit 
    @event = Event.find(params[:id])
  end

  def update 
    @event = Event.find(params[:id])
    
    @event.update(event_params)
    redirect_to @event
  end


  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :starts_at)
  end
  
  
  
end
