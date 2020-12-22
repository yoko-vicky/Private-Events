class InvitesController < ApplicationController
  def create
    user = User.where(name: params[:invite][:user]).first
    event = Event.find(params[:event_id])
    if event.attendees.any? { |attendee| attendee.name == user.name }
      redirect_to event_path(event)
      flash[:alert] = "#{user.name} is already invited to #{event.title}"
    else
      event.attendees << user
      redirect_to event_path(event)
      flash[:notice] = "#{user.name} is invited to #{event.title}"
    end
  end
end
