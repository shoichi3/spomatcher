module MypageSupport
  def mypage
    find('#icon').click
    click_link 'マイページ'
  end
end
