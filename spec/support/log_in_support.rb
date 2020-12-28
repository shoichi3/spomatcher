module LogInSupport
  def log_in(user)
    visit root_path
    expect(page).to have_content('ログイン')
    click_on 'ログイン'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    expect{
      click_button 'ログイン'
    }.to change { User.count}.by(0)
    expect(page).to have_css '.fa-edit'
  end
end