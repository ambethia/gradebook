class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery :with => :exception
  force_ssl :if => :ssl_configured?

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_authentication
    unless current_user
      redirect_to root_url, :alert => "Authentication Required."
    end
  end

  def ssl_configured?
    Rails.env.production?
  end
end
