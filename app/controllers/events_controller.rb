class EventsController < ApplicationController
  before_action :login_require, except: %i[index]
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
      flash[:notice] = "#{@event.title} is successfully created..."
      redirect_to event_path(@event)
    else
      flash[:alert] = 'Something is wrong'
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date)
  end
end
