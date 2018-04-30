module SessionsHelper
    
    # Assign user ID to session ID for login functionality

    def log_in(user)
        session[:user_id] = user.id
    end
    
    # Assign the user_ID/session_ID relationship to a variable
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    # Check if current_user is assigned i.e. verify someone is logged in
    
    def logged_in?
        !current_user.nil?
    end
    
    # Delete session, reset current_user variable
    
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
