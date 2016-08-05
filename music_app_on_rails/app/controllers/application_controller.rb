class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login_user!(user)
    session[:session_token] = user.reset_session_token!
    redirect_to bands_url
  end

  def logout_user!(user)
    user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

  def logged_in?
    return true if current_user
    false
  end

  def author?(note)
    current_user == note.author
  end

  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_session_url
    end
  end
end
