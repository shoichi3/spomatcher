module LogOutSupport
  def log_out()
    find('#icon').click
    click_on 'ログアウト'
  end
end