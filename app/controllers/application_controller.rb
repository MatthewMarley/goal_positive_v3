class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?, :require_user
  def current_user
    # If @current_user is undefined, then assign it the following value. (also only do this is session[:user_id] exists)
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    # Double bang operators make current_user into a boolean value. Therefore logged_in? is true if 
    # current user is true (exists), and logged_in? is false if current_user is false (Does not exist)
    !!current_user 
  end
  
  def require_user
    # !logged_in means if logged_in? is false, which would mean current_user is false, which would mean
    # the current user does not exist as it does not have a session id
    if !logged_in?
        flash[:danger] = "You must be logged in to perform that action"
        redirect_to root_path
    end
  end
  
  
end
