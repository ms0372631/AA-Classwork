class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by(session[:user])
    end

    def logged_in?
        current_user != nil
    end

    def login(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout
        current_user.reset_session_token!
        session[:session_token] = nil
        current_user = nil
    end
    
    def require_current_user
      redirect_to cats_url if self.logged_in?
    end
end
