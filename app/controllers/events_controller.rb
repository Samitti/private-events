class EventsController < ApplicationController
  before_action :sign_in, only: %i[join show]

  def index
    @events = case params[:filter]
              when 'past'
                Event.past
              else
                Event.upcoming
              end
  end

  def show
    @event = Event.find(params[:id])
    @users = User.all

    @current_attendee = current_user.user_events.find_by(event_id: @event.id) if current_user
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
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

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  def join
    # flash[:notice] = params
    # redirect_to event_path(params[:event_id])

    @user_event = UserEvent.join_event(params[:user_id], params[:event_id])
    if @user_event.save # rubocop:disable Style/GuardClause
      flash[:notice] = 'Successfully Joined event'
      redirect_to event_path(params[:event_id])
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :starts_at)
  end
end
