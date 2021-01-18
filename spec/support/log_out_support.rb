module LogOutSupport
  def log_out()
    find('.user-image').click
    click_on 'ログアウト'
  end
end