require 'rails_helper'

RSpec.describe "メッセージ送信機能(サインイン後)", type: :system do
  before do
    @post = build(:post)
    @message = build(:message)
  end

  context 'メッセージを送信することができるとき' do
    it 'メッセージ内容と画像を添付するとメッセージを送信することができること' do
      sign_up(@post.user)
      post(@post)
      log_out()
      sign_up(@message.user)
      make_room(@post.user)
      fill_in 'message-text', with: @message.text
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('message[image]', image_path, make_visible: true)
      click_button '送信'
      expect(page).to have_content @message.text
    end

    it '画像を添付するとメッセージを送信することができること' do
      sign_up(@post.user)
      post(@post)
      log_out()
      sign_up(@message.user)
      make_room(@post.user)
      fill_in 'message-text', with: ""
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('message[image]', image_path, make_visible: true)
      click_button '送信'
      expect(page).to have_css '.image'
    end
  end
  context 'ヘッダーからメッセージルームに遷移し、メッセージを送信することができるとき' do
    it 'メッセージ内容と画像を添付するとメッセージを送信することができること' do
      sign_up(@post.user)
      post(@post)
      log_out()
      sign_up(@message.user)
      make_room(@post.user)
      click_link 'Spomatcher'
      find('.fa-envelope').click
      expect(page).to have_content("#{@message.user.name}さんのトークルーム")
      find('.message-link').click
      fill_in 'message-text', with: @message.text
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('message[image]', image_path, make_visible: true)
      click_button '送信'
      expect(page).to have_content @message.text
    end
    
    it '画像を添付するとメッセージを送信することができること' do
      sign_up(@post.user)
      post(@post)
      log_out()
      sign_up(@message.user)
      make_room(@post.user)
      click_link 'Spomatcher'
      find('.fa-envelope').click
      expect(page).to have_content("#{@message.user.name}さんのトークルーム")
      find('.message-link').click
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('message[image]', image_path, make_visible: true)
      click_button '送信'
      expect(page).to have_css '.image'
    end
  end
end

RSpec.describe "メッセージ送信機能(ログイン後)", type: :system do
  before do
    @post = build(:post)
    @message = build(:message)
  end

  context 'メッセージを送信することができるとき' do
    it 'メッセージ内容と画像を添付するとメッセージを送信することができること' do
      sign_up(@post.user)
      post(@post)
      log_out()
      sign_up(@message.user)
      log_out()
      log_in(@message.user)
      make_room(@post.user)
      fill_in 'message-text', with: @message.text
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('message[image]', image_path, make_visible: true)
      click_button '送信'
      expect(page).to have_content @message.text
    end

    it '画像を添付するとメッセージを送信することができること' do
      sign_up(@post.user)
      post(@post)
      log_out()
      sign_up(@message.user)
      log_out()
      log_in(@message.user)
      make_room(@post.user)
      fill_in 'message-text', with: ""
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('message[image]', image_path, make_visible: true)
      click_button '送信'
      expect(page).to have_css '.image'
    end
  end
  context 'ヘッダーからメッセージルームに遷移し、メッセージを送信することができるとき' do
    it 'メッセージ内容と画像を添付するとメッセージを送信することができること' do
      sign_up(@post.user)
      post(@post)
      log_out()
      sign_up(@message.user)
      log_out()
      log_in(@message.user)
      make_room(@post.user)
      click_link 'Spomatcher'
      find('.fa-envelope').click
      expect(page).to have_content("#{@message.user.name}さんのトークルーム")
      find('.message-link').click
      fill_in 'message-text', with: @message.text
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('message[image]', image_path, make_visible: true)
      click_button '送信'
      expect(page).to have_content @message.text
    end
    
    it '画像を添付するとメッセージを送信することができること' do
      sign_up(@post.user)
      post(@post)
      log_out()
      sign_up(@message.user)
      log_out()
      log_in(@message.user)
      make_room(@post.user)
      click_link 'Spomatcher'
      find('.fa-envelope').click
      expect(page).to have_content("#{@message.user.name}さんのトークルーム")
      find('.message-link').click
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('message[image]', image_path, make_visible: true)
      click_button '送信'
      expect(page).to have_css '.image'
    end
  end
end