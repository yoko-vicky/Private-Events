class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :login_require, except: %i[index]
  before_action :same_user_require, only: %i[edit update destroy]

  def index
    @events = Event.all
  end

  def show; end

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

  def edit; end

  def update
    if @event.update(event_params)
      flash[:notice] = "#{@event.title} is successfully updated..."
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    flash[:notice] = "#{@event.title} is successfully deleted..."
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def same_user_require
    return if @event.creator == current_user

    flash[:alert] = 'You can only edit or destroy your own events.'
    redirect_to @event
  end
end
