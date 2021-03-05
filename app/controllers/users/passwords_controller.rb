class Users::PasswordsController < Devise::PasswordsController
  before_action :check_guest, only: :create

  def check_guest
    redirect_to root_path, alert: 'ゲストユーザーの変更・削除はできません。' if params[:user][:email].downcase == 'guest@example.com'
  end
end
