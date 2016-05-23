class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def restrict_access
    if !current_user
      redirect_to new_session_path
    end
  end  

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = 'http://localhost:3000'
  end

  private
  def current_usez
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end
