module MessageSupport
  def message(message)
    fill_in 'message-text', with: message.text
    image_path = Rails.root.join('app/assets/images/0116.png')
    attach_file('message[image]', image_path, make_visible: true)
    click_button '送信'
    expect(page).to have_content message.text
  end
end