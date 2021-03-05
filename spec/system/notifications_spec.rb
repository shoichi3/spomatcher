require 'rails_helper'

RSpec.describe '通知機能', type: :system do
  before do
    @post = build(:post)
    @user = build(:user)
    @review = build(:review)
    @message = build(:message)
  end

  context '通知が届くとき' do
    it 'フォローされたとき通知が届くこと' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      find('.post-link').click
      follow
      log_out
      log_in(@post.user)
      expect(page).to have_css '.n-circle'
      find('.n-circle').click
      expect(page).to have_content "#{@user.name}さんがあなたをフォローしました"
    end

    it 'お気に入り登録されたとき通知が届くこと' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      favorite
      log_out
      log_in(@post.user)
      expect(page).to have_css '.n-circle'
      find('.n-circle').click
      expect(page).to have_content "#{@user.name}さんがあなたの投稿をお気に入り登録しました"
    end

    it 'レビューされたとき通知が届くこと' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      review(@review)
      log_out
      log_in(@post.user)
      expect(page).to have_css '.n-circle'
      find('.n-circle').click
      expect(page).to have_content "#{@user.name}さんからレビューが投稿されました"
    end

    it 'メッセージが送信されたとき通知が届くこと' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@message.user)
      make_room(@post.user)
      message(@message)
      log_out
      log_in(@post.user)
      expect(page).to have_css '.n-circle'
      find('.n-circle').click
      expect(page).to have_content "#{@message.user.name}さんからメッセージが届きました"
    end
  end

  context '通知が届いていないとき' do
    it '通知が届いていないとき、その旨が通知一覧ページで表示されていること' do
      sign_up(@user)
      find('.fa-bell').click
      expect(page).to have_content '通知はありません'
    end
  end
end
