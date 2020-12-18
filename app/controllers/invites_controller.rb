class InvitesController < ApplicationController
    def create
        user = User.where(name: params[:invite][:user])
        event = Event.find(params[:event_id])
        event.attendees << user
        flash[:notice] = "#{user.name} is invited to #{event.title}"
        redirect_back(fallback_location: root_path)
    end
end
