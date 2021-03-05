module SignUpSupport
  def sign_up(user)
    visit root_path
    expect(page).to have_content('新規登録')
    click_on '新規登録'
    fill_in 'user_name', with: user.name
    fill_in 'user_profile', with: user.profile
    image_path = Rails.root.join('app/assets/images/default.png')
    attach_file('user[image]', image_path, make_visible: true)
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password_confirmation
    expect  do
      click_button '新規登録'
    end.to change { User.count }.by(1)
    expect(page).to have_css '.fa-edit'
  end
end
