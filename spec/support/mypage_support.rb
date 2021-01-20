module MypageSupport
  def mypage()
    find('.user-image').click
    click_link 'マイページ'
  end
end