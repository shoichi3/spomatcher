module MakeRoomSupport
  def make_room(user)
    find('.post-link').click
    expect do
      click_on 'メッセージを送信'
    end.to change { Room.count }.by(1)
    expect(page).to have_content user.name
  end
end
