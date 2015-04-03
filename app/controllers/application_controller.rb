class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_user
    @current_user ||= User.find_by(auth_token: (cookies[:auth_token]))
  end
  helper_method :current_user

  def current_user?
    @current_user
  end
  helper_method :current_user?

  def employee_user
    @employee ||= Employee.find_by(auth_token: cookies[:auth_token])
  end

  def admin_user
    @admin ||= Admin.find_by(auth_token: (cookies[:auth_token]))
  end
  helper_method :admin_user

  def current_user=(user)
    @current_user = user
  end

  

end
