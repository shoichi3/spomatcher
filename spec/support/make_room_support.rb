module MakeRoomSupport
  def make_room(user)
    find('.post-link').click
    expect{
      click_on 'メッセージを送信'
    }.to change { Room.count }.by(1)
    expect(page).to have_content user.name
  end
end