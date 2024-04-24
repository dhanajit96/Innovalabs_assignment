class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def current_user
    @user || User.find(session[:user_id]) if session[:user_id].present?
  end

  def require_login
    return true if controller_name == "logins" || controller_path.start_with?("api/")
    unless logged_in?
      flash[:error] = "You must be logged in to access this page."
      redirect_to new_login_path # Adjust the path to your login page
    end
  end

  def logged_in?
    session[:user_id].present?
  end
end
