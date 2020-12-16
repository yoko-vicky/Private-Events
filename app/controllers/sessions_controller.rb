class SessionsController < ApplicationController
  def new; end

  def create
    # byebug
    user = User.where(name: params[:session][:name]) if params[:session][:name]
    session[:user_id] = user.id
  end

  def destroy; end
end
