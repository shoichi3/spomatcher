require 'rails_helper'

RSpec.describe 'お気に入り機能(サインイン後)', type: :system do
  before do
    @post = build(:post)
    @user = build(:user)
  end

  context 'お気に入り登録ができるとき' do
    it 'サインインしているならお気に入り登録できること' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      favorite
    end

    it 'サインインしているならお気に入り登録を解除することができること' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      favorite
      find('.fa-star').click
      expect(page).to have_css '.far'
    end
  end

  # context 'お気に入り登録ができないとき' do
  #   it 'サインインしていないときお気に入り登録するためのアイコンが存在しないこと' do
  #     sign_up(@post.user)
  #     post(@post)
  #     log_out()
  #     find('.post-link').click
  #     expect(page).to have_no_css '.far'
  #   end
  # end
end

RSpec.describe 'お気に入り機能(ログイン後)', type: :system do
  before do
    @post = build(:post)
    @user = build(:user)
  end

  context 'お気に入り登録ができるとき' do
    it 'サインインしているならお気に入り登録できること' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      log_out
      log_in(@user)
      favorite
    end

    it 'サインインしているならお気に入り登録を解除することができること' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      log_out
      log_in(@user)
      favorite
      find('.fa-star').click
      expect(page).to have_css '.far'
    end
  end

  # context 'お気に入り登録ができないとき' do
  #   it 'サインインしていないときお気に入り登録するためのアイコンが存在しないこと' do
  #     sign_up(@post.user)
  #     post(@post)
  #     log_out()
  #     find('.post-link').click
  #     expect(page).to have_no_css '.far'
  #   end
  # end
end

RSpec.describe 'マイページでお気に入りした投稿の表示(サインイン後)', type: :system do
  before do
    @post = build(:post)
    @user = build(:user)
  end

  context 'マイページでお気に入りした投稿を確認することができる' do
    it '投稿をお気に入り登録した後、マイページへ遷移するとお気に入りした投稿が表示されること' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      favorite
      mypage
      find('#favorited-post').click
      expect(page).to have_css '.post-link'
    end
  end

  context '他ユーザーのマイページでお気に入りした投稿を確認することができる' do
    it '投稿をお気に入り登録した後、マイページへ遷移するとお気に入りした投稿が表示されること' do
      sign_up(@post.user)
      post(@post)
      favorite
      log_out
      sign_up(@user)
      find('.post-link').click
      find('.icon').click
      find('#favorited-post').click
      expect(page).to have_css '.post-link'
    end
  end
end

RSpec.describe 'マイページでお気に入りした投稿の表示(ログイン後)', type: :system do
  before do
    @post = build(:post)
    @user = build(:user)
  end

  context 'マイページでお気に入りした投稿を確認することができる' do
    it '投稿をお気に入り登録した後、マイページへ遷移するとお気に入りした投稿が表示されること' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      log_out
      log_in(@user)
      favorite
      mypage
      find('#favorited-post').click
      expect(page).to have_css '.post-link'
    end
  end

  context '他ユーザーのマイページでお気に入りした投稿を確認することができる' do
    it '投稿をお気に入り登録した後、マイページへ遷移するとお気に入りした投稿が表示されること' do
      sign_up(@post.user)
      post(@post)
      favorite
      log_out
      sign_up(@user)
      log_out
      log_in(@user)
      find('.post-link').click
      find('.icon').click
      find('#favorited-post').click
      expect(page).to have_css '.post-link'
    end
  end
end
