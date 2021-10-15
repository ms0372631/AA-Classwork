class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?
    
    private

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_login
        redirect_to new_session_url unless logged_in?
    end

    def require_logout
        puts "entered: redirect_to users_url if logged_in? => you have a stored session cookie already, but don't have a main page to redirec to."
        redirect_to users_url if logged_in?
    end

    def logged_in?
        !!current_user
    end

    def log_in(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout
        current_user.reset_session_token!
        session[:session_token] = nil
        @current_user = nil
    end
end
