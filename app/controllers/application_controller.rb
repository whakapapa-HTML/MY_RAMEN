class ApplicationController < ActionController::Base
  before_action :authenticate_admin!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  #protectedは呼び出された他のコントローラからも参照可能
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction])  # アカウント編集の時にnameとprofileのストロングパラメータを追加
  end

  def authenticate
    return if user_signed_in?
    redirect_to new_user_session_path, alert: 'ログインしてください'
  end



end
