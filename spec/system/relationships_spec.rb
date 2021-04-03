require 'rails_helper'

RSpec.describe 'フォロー機能(サインイン後)', type: :system do
  before do
    @post = build(:post)
    @post2 = build(:post)
    @post3 = build(:post)
    @user = build(:user)
  end

  context 'フォローした後、フォロ中ーの欄またはフォロワー欄に表示されているとき' do
    it 'ユーザーをフォローした後、フォロー中の欄に表示されていること' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      find('.post-link').click
      follow
      mypage
      find('.followings').click
      expect(page).to have_css '.user-box'
    end

    it 'ユーザーをフォローした後、フォロワー欄からフォロー中の欄に遷移しても表示されていること' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      find('.post-link').click
      follow
      mypage
      find('.followers').click
      find('#follower').click
      expect(page).to have_css '.user-box'
    end

    it 'ユーザーをフォローした後、そのユーザーのフォロワー欄に自分の情報が表示されていること' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      find('.post-link').click
      follow
      find('.followers').click
      expect(page).to have_content @user.name
    end

    it 'ユーザーをフォローした後、フォロー欄からフォロワー欄に遷移しても自分の情報が表示されていること' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      find('.post-link').click
      follow
      find('.followings').click
      find('#following').click
      expect(page).to have_content @user.name
    end
  end

  context 'フォローを解除するとフォロー中の欄にユーザー情報が表示されないとき' do
    it 'フォロー中の欄に表示されていたユーザー情報がなくなること' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      find('.post-link').click
      follow
      mypage
      find('.followings').click
      expect(page).to have_css '.user-box'
      find('.follow-button').click
      visit current_path
      expect(page).to have_no_css '.user-box'
    end
  end

  context 'フォローできないとき' do
    it 'フォロワー欄に自分が表示されているとき、フォローボタンは存在しないこと' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      find('.post-link').click
      follow
      find('.followers').click
      expect(page).to have_content @user.name
      expect(page).to have_no_css '#follow_form'
    end
  end

  context 'フォロワー欄からフォローを解除することができること' do
    it '他ユーザーのフォロワー欄から自分がフォローしているユーザーのフォローを解除することができるとき' do
      sign_up(@post3.user)
      post(@post3)
      log_out
      sign_up(@post.user)
      post(@post)
      page.all('.post-link')[1].click
      follow
      log_out
      sign_up(@post2.user)
      page.all('.post-link')[1].click
      follow
      visit root_path
      page.all('.post-link')[1].click
      find('.icon').click
      find('.followers').click
      find('.follow-button').click
      expect(page).to have_css '.text-white'
    end
  end
end

RSpec.describe 'フォロー機能(ログイン後)', type: :system do
  before do
    @post = build(:post)
    @post2 = build(:post)
    @post3 = build(:post)
    @user = build(:user)
  end

  context 'フォローした後、フォロ中ーの欄またはフォロワー欄に表示されているとき' do
    it 'ユーザーをフォローした後、フォロー中の欄に表示されていること' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      log_out
      log_in(@user)
      find('.post-link').click
      follow
      mypage
      find('.followings').click
      expect(page).to have_css '.user-box'
    end

    it 'ユーザーをフォローした後、フォロワー欄からフォロー中の欄に遷移しても表示されていること' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      log_out
      log_in(@user)
      find('.post-link').click
      follow
      mypage
      find('.followers').click
      find('#follower').click
      expect(page).to have_css '.user-box'
    end

    it 'ユーザーをフォローした後、そのユーザーのフォロワー欄に自分の情報が表示されていること' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      log_out
      log_in(@user)
      find('.post-link').click
      follow
      find('.followers').click
      expect(page).to have_content @user.name
    end

    it 'ユーザーをフォローした後、フォロー欄からフォロワー欄に遷移しても自分の情報が表示されていること' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      log_out
      log_in(@user)
      find('.post-link').click
      follow
      find('.followings').click
      find('#following').click
      expect(page).to have_content @user.name
    end

    it '相互フォローをするとフォロー中の欄とフォロワー欄にそれぞれユーザーが表示されること' do
      sign_up(@post2.user)
      post(@post2)
      log_out
      sign_up(@post.user)
      post(@post)
      page.all('.post-link')[1].click
      follow
      log_out
      log_in(@post2.user)
      first('.post-link').click
      follow
      find('.followings').click
      expect(page).to have_css '.user-box'
      find('#follower').click
      expect(page).to have_content @post2.user.name
    end
  end

  context 'フォローを解除するとフォロー中の欄にユーザー情報が表示されないとき' do
    it 'フォロー中の欄に表示されていたユーザー情報がなくなること' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      log_out
      log_in(@user)
      find('.post-link').click
      follow
      mypage
      find('.followings').click
      expect(page).to have_css '.user-box'
      find('.follow-button').click
      visit current_path
      expect(page).to have_no_css '.user-box'
    end
  end

  context 'フォローできないとき' do
    it 'フォロワー欄に自分が表示されているとき、フォローボタンは存在しないこと' do
      sign_up(@post.user)
      post(@post)
      log_out
      sign_up(@user)
      log_out
      log_in(@user)
      find('.post-link').click
      follow
      find('.followers').click
      expect(page).to have_content @user.name
      expect(page).to have_no_css '#follow_form'
    end
  end

  context 'フォロワー欄からフォローを解除することができること' do
    it '他ユーザーのフォロワー欄から自分がフォローしているユーザーのフォローを解除することができるとき' do
      sign_up(@post3.user)
      post(@post3)
      log_out
      sign_up(@post.user)
      post(@post)
      page.all('.post-link')[1].click
      follow
      log_out
      sign_up(@post2.user)
      log_out
      log_in(@post2.user)
      page.all('.post-link')[1].click
      follow
      visit root_path
      page.all('.post-link')[1].click
      find('.icon').click
      find('.followers').click
      find('.follow-button').click
      expect(page).to have_css '.text-white'
    end
  end
end
