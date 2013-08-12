class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize

  # Makes method available in views
  helper_method :current_user

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    unless current_user
      redirect_to login_path
    end
  end
end
