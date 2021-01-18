require 'rails_helper'

RSpec.describe "メッセージルーム作成機能(サインイン後)", type: :system do
  before do
    @post = build(:post)
    @user = build(:user)
  end

  context 'メッセージルームを作成することができるとき' do
    it '投稿者と異なるユーザーの場合、メッセージルームへ遷移することができる' do
      sign_up(@post.user)
      post(@post)
      log_out()
      sign_up(@user)
      make_room(@post.user)
    end
  end

  context 'メッセージルームを作成することができないとき' do
    it '自身の投稿の場合、メッセージを送信というボタンは存在しない' do
      sign_up(@post.user)
      post(@post)
      find('.post-link').click
      expect(page).to have_no_content('メッセージを送信')
    end
    
    it '同様のユーザーと新たにメッセージルームを作成することはできないこと' do
      sign_up(@post.user)
      post(@post)
      log_out()
      sign_up(@user)
      make_room(@post.user)
      click_link 'Spomatcher'
      find('.post-link').click
      expect{
        click_on 'メッセージを送信'
      }.to change { Room.count }.by(0)
      expect(page).to have_content @post.user.name
    end
  end
end

RSpec.describe 'メッセージルーム作成機能(ログイン後)', type: :system do
  before do
    @post = build(:post)
    @user = build(:user)
  end
  
  context 'メッセージルームを作成することができるとき' do
    it '投稿者と異なるユーザーの場合、メッセージルームへ遷移することができること' do
      sign_up(@post.user)
      post(@post)
      log_out()
      sign_up(@user)
      log_out()
      log_in(@user)
      make_room(@post.user)
    end
  end
  
  context 'メッセージルームを作成することができないとき' do
    it '自身の投稿の場合、メッセージを送信というボタンは存在しない' do
      sign_up(@post.user)
      post(@post)
      log_out()
      log_in(@post.user)    
      find('.post-link').click
      expect(page).to have_no_content('メッセージを送信')
    end
    
    it '同様のユーザーと新たにメッセージルームを作成することはできないこと' do
      sign_up(@post.user)
      post(@post)
      log_out()
      sign_up(@user)
      log_out()
      log_in(@user)
      make_room(@post.user)
      click_link 'Spomatcher'
      find('.post-link').click
      expect{
        click_on 'メッセージを送信'
      }.to change { Room.count }.by(0)
      expect(page).to have_content @post.user.name
    end
  end
end