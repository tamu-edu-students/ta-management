module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def log_out(user)
        session.delete(:user_id)
        session[:user_id] = nil
    end


    # Returns true if the given user is the current user.
    def current_user?(user)
        user == current_user
    end


        # Returns the current logged-in user (if any).
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    def is_admin?
        current_user[:access_level] == 'admin'
    end
end
