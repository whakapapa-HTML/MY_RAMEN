class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  #protectedは呼び出された他のコントローラからも参照可能
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def authenticate
    return if user_signed_in?
    redirect_to new_user_session_path, alert: 'ログインしてください'
  end

end
