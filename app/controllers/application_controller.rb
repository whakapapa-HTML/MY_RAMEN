class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # protectedは呼び出された他のコントローラからも参照可能
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name introduction])  # アカウント編集の時にnameとprofileのストロングパラメータを追加
  end
end
