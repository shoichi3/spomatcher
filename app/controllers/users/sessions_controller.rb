class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = LoginGuestUserService.guest
    sign_in user
    redirect_to root_path
    flash[:notice] = 'ゲストユーザーとしてログインしました。'
  end
end
