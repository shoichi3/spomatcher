class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest_user, only: [:destroy, :update]
  def check_guest_user
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザー削除・編集はできません'
    end
  end
  
end