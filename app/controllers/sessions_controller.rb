class SessionsController < ApplicationController
  def new; end

  def create
    user = User.where(name: params[:session][:name]).first if params[:session][:name]
    if user
      session[:user_id] = user.id
      flash[:notice] = 'Successfully logged in'
      redirect_to user_path(user)
    else
      flash[:alert] = 'You first need to sign up'
      redirect_to new_user_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to root_path
  end
end
