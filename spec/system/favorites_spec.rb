require 'rails_helper'

RSpec.describe "お気に入り機能(サインイン後)", type: :system do
  before do
    @post = build(:post)
    @user = build(:user)
  end

  context 'お気に入り登録ができるとき' do
    it 'サインインしているならお気に入り登録できること' do
      sign_up(@post.user)
      post(@post)
      log_out()
      sign_up(@user)
      find('.post-link').click
      find('.fa-star').click
      expect(page).to have_css '.fas'
    end

    it 'サインインしているならお気に入り登録を解除することができること' do
      sign_up(@post.user)
      post(@post)
      log_out()
      sign_up(@user)
      find('.post-link').click
      find('.fa-star').click
      expect(page).to have_css '.fas'
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

RSpec.describe "お気に入り機能(ログイン後)", type: :system do
  before do
    @post = build(:post)
    @user = build(:user)
  end

  context 'お気に入り登録ができるとき' do
    it 'サインインしているならお気に入り登録できること' do
      sign_up(@post.user)
      post(@post)
      log_out()
      sign_up(@user)
      log_out()
      log_in(@user)
      find('.post-link').click
      find('.fa-star').click
      expect(page).to have_css '.fas'
    end

    it 'サインインしているならお気に入り登録を解除することができること' do
      sign_up(@post.user)
      post(@post)
      log_out()
      sign_up(@user)
      log_out()
      log_in(@user)
      find('.post-link').click
      find('.fa-star').click
      expect(page).to have_css '.fas'
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