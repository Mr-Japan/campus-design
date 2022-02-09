class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger, :notice
  
  helper_method :current_user, :logged_in?
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def current_admin_user
    # TODO:  sessionからdeviseのログインユーザのidをとりだす（なぜこうなっているかは未調査）
    admin_user_id = session["warden.user.admin_user.key"][0][0]
    @current_admin_user ||= AdminUser.find_by(id: admin_user_id)
  end

  def logged_in?
    !current_user.nil?
  end
end
