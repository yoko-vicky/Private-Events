class ApplicationController < ActionController::Base
    def current_user
        User.find(session[:user_id]) if logged_in?
    end

    def logged_in?
        !session[:user_id].nil?
    end

    helper_method :current_user, :logged_in?
end
