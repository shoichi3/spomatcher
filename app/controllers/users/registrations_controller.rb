class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest_user, only: [:destroy, :update]
  before_action :configure_account_update_params, only: :update

  def check_guest_user
    redirect_to root_path, alert: 'ゲストユーザー削除・編集はできません' if resource.email == 'guest@example.com'
  end

  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :image])
  end
end
