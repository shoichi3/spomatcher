require 'rails_helper'

RSpec.describe 'レビュー機能(サインイン後)', type: :system do
  before do
    @post = build(:post)
    @user = build(:user)
    @review = build(:review)
  end

  context 'レビューを投稿することができるとき' do
    it '正しく情報を入力するとレビューを投稿することができること' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      review(@review)
    end
  end

  context 'レビューを投稿することができないとき' do
    it '自身のレビュー一覧ページからレビュー作成ページへ遷移することができないこと' do
      sign_up(@user)
      mypage
      find('#count').click
      expect(page).to have_no_content 'レビューを書く'
    end
    it '評価およびレビューを入力していないとき、レビューを投稿することができないこと' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      find('.post-link').click
      find('.icon').click
      find('#count').click
      click_on 'レビューを書く'
      fill_in 'review_content', with: ''
      expect  do
        click_button '投稿する'
      end.to change { Review.count }.by(0)
      expect(page).to have_content '評価を入力してください。'
      expect(page).to have_content 'レビューを入力してください。'
    end

    it '評価を入力していないとき、レビューを投稿することができないこと' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      find('.post-link').click
      find('.icon').click
      find('#count').click
      click_on 'レビューを書く'
      fill_in 'review_content', with: @review.content
      expect  do
        click_button '投稿する'
      end.to change { Review.count }.by(0)
      expect(page).to have_content '評価を入力してください。'
    end

    it 'レビューの内容を入力していないとき、レビューを投稿することができないこと' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      find('.post-link').click
      find('.icon').click
      find('#count').click
      click_on 'レビューを書く'
      page.all('.fa-star')[4].click
      fill_in 'review_content', with: ''
      expect  do
        click_button '投稿する'
      end.to change { Review.count }.by(0)
      expect(page).to have_content 'レビューを入力してください。'
    end
  end
end

RSpec.describe 'レビュー機能(ログイン後)', type: :system do
  before do
    @post = build(:post)
    @user = build(:user)
    @review = build(:review)
  end

  context 'レビューを投稿することができるとき' do
    it '正しく情報を入力するとレビューを投稿することができること' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      log_out
      log_in(@user)
      review(@review)
    end
  end

  context 'レビューを投稿することができないとき' do
    it '自身のレビュー一覧ページからレビュー作成ページへ遷移することができないこと' do
      sign_up(@user)
      log_out
      log_in(@user)
      mypage
      find('#count').click
      expect(page).to have_no_content 'レビューを書く'
    end
    it '評価およびレビューを入力していないとき、レビューを投稿することができないこと' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      log_out
      log_in(@user)
      find('.post-link').click
      find('.icon').click
      find('#count').click
      click_on 'レビューを書く'
      fill_in 'review_content', with: ''
      expect  do
        click_button '投稿する'
      end.to change { Review.count }.by(0)
      expect(page).to have_content '評価を入力してください。'
      expect(page).to have_content 'レビューを入力してください。'
    end

    it '評価を入力していないとき、レビューを投稿することができないこと' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      log_out
      log_in(@user)
      find('.post-link').click
      find('.icon').click
      find('#count').click
      click_on 'レビューを書く'
      fill_in 'review_content', with: @review.content
      expect  do
        click_button '投稿する'
      end.to change { Review.count }.by(0)
      expect(page).to have_content '評価を入力してください。'
    end

    it 'レビューの内容を入力していないとき、レビューを投稿することができないこと' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      log_out
      log_in(@user)
      find('.post-link').click
      find('.icon').click
      find('#count').click
      click_on 'レビューを書く'
      page.all('.fa-star')[4].click
      fill_in 'review_content', with: ''
      expect  do
        click_button '投稿する'
      end.to change { Review.count }.by(0)
      expect(page).to have_content 'レビューを入力してください。'
    end
  end
end
