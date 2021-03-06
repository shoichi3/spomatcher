require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = build(:user)
  end

  context 'ユーザーの新規登録ができるとき' do
    it '正しい情報を入力すると、ユーザーの新規登録ができトップページへ遷移する' do
      sign_up(@user)
    end

    it '自己紹介が空欄であっても、ユーザーの新規登録ができトップページへ遷移する' do
      visit root_path
      expect(page).to have_content('新規登録')
      click_on '新規登録'
      fill_in 'user_name', with: @user.name
      fill_in 'user_profile', with: ''
      image_path = Rails.root.join('app/assets/images/default.png')
      attach_file('user[image]', image_path, make_visible: true)
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password_confirmation
      expect  do
        click_button '新規登録'
      end.to change { User.count }.by(1)
      expect(page).to have_css '.user-image'
    end

    it 'プロフィール画像が空欄であっても、ユーザーの新規登録ができトップページへ遷移する' do
      visit root_path
      expect(page).to have_content('新規登録')
      click_on '新規登録'
      fill_in 'user_name', with: @user.name
      fill_in 'user_profile', with: @user.profile
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password_confirmation
      expect  do
        click_button '新規登録'
      end.to change { User.count }.by(1)
      expect(page).to have_css '.user-image'
    end
  end

  context 'ユーザーの新規登録ができないとき' do
    it 'ニックネームが空欄のときユーザーの新規登録ができない' do
      visit root_path
      expect(page).to have_content('新規登録')
      click_on '新規登録'
      fill_in 'user_name', with: ''
      fill_in 'user_profile', with: @user.profile
      image_path = Rails.root.join('app/assets/images/default.png')
      attach_file('user[image]', image_path, make_visible: true)
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password_confirmation
      expect  do
        click_button '新規登録'
      end.to change { User.count }.by(0)
      expect(page).to have_content('新規登録')
    end

    it 'Eメールが空欄のときユーザーの新規登録ができない' do
      visit root_path
      expect(page).to have_content('新規登録')
      click_on '新規登録'
      fill_in 'user_name', with: @user.name
      fill_in 'user_profile', with: @user.profile
      image_path = Rails.root.join('app/assets/images/default.png')
      attach_file('user[image]', image_path, make_visible: true)
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password_confirmation
      expect  do
        click_button '新規登録'
      end.to change { User.count }.by(0)
      expect(page).to have_content('新規登録')
    end

    it 'パスワードが空欄のときユーザーの新規登録ができない' do
      visit root_path
      expect(page).to have_content('新規登録')
      click_on '新規登録'
      fill_in 'user_name', with: @user.name
      fill_in 'user_profile', with: @user.profile
      image_path = Rails.root.join('app/assets/images/default.png')
      attach_file('user[image]', image_path, make_visible: true)
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: ''
      fill_in 'user_password_confirmation', with: @user.password_confirmation
      expect  do
        click_button '新規登録'
      end.to change { User.count }.by(0)
      expect(page).to have_content('新規登録')
    end

    it 'パスワード（確認用）が空欄のときユーザーの新規登録ができない' do
      visit root_path
      expect(page).to have_content('新規登録')
      click_on '新規登録'
      fill_in 'user_name', with: @user.name
      fill_in 'user_profile', with: @user.profile
      image_path = Rails.root.join('app/assets/images/default.png')
      attach_file('user[image]', image_path, make_visible: true)
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: ''
      expect  do
        click_button '新規登録'
      end.to change { User.count }.by(0)
      expect(page).to have_content('新規登録')
    end

    it 'パスワードとパスワード（確認用）が異なるときユーザーの新規登録ができない' do
      @user.password_confirmation = 'tmew3ym'
      visit root_path
      expect(page).to have_content('新規登録')
      click_on '新規登録'
      fill_in 'user_name', with: @user.name
      fill_in 'user_profile', with: @user.profile
      image_path = Rails.root.join('app/assets/images/default.png')
      attach_file('user[image]', image_path, make_visible: true)
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password_confirmation
      expect  do
        click_button '新規登録'
      end.to change { User.count }.by(0)
      expect(page).to have_content('新規登録')
    end

    it 'パスワードが5文字以下のときユーザーの新規登録ができない' do
      @user.password = 'tee32'
      @user.password_confirmation = @user.password
      visit root_path
      expect(page).to have_content('新規登録')
      click_on '新規登録'
      fill_in 'user_name', with: @user.name
      fill_in 'user_profile', with: @user.profile
      image_path = Rails.root.join('app/assets/images/default.png')
      attach_file('user[image]', image_path, make_visible: true)
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password_confirmation
      expect  do
        click_button '新規登録'
      end.to change { User.count }.by(0)
      expect(page).to have_content('新規登録')
    end

    it 'パスワードがアルファベットのみのときユーザーの新規登録ができない' do
      @user.password = 'teegrjf'
      @user.password_confirmation = @user.password
      visit root_path
      expect(page).to have_content('新規登録')
      click_on '新規登録'
      fill_in 'user_name', with: @user.name
      fill_in 'user_profile', with: @user.profile
      image_path = Rails.root.join('app/assets/images/default.png')
      attach_file('user[image]', image_path, make_visible: true)
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password_confirmation
      expect  do
        click_button '新規登録'
      end.to change { User.count }.by(0)
      expect(page).to have_content('新規登録')
    end

    it 'パスワードが数字のみのときユーザーの新規登録ができない' do
      @user.password = '356578'
      @user.password_confirmation = @user.password
      visit root_path
      expect(page).to have_content('新規登録')
      click_on '新規登録'
      fill_in 'user_name', with: @user.name
      fill_in 'user_profile', with: @user.profile
      image_path = Rails.root.join('app/assets/images/default.png')
      attach_file('user[image]', image_path, make_visible: true)
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password_confirmation
      expect  do
        click_button '新規登録'
      end.to change { User.count }.by(0)
      expect(page).to have_content('新規登録')
    end

    it 'パスワードに全角文字含まれているときユーザーの新規登録ができない' do
      @user.password = '３nteewahえｄ'
      @user.password_confirmation = @user.password
      visit root_path
      expect(page).to have_content('新規登録')
      click_on '新規登録'
      fill_in 'user_name', with: @user.name
      fill_in 'user_profile', with: @user.profile
      image_path = Rails.root.join('app/assets/images/default.png')
      attach_file('user[image]', image_path, make_visible: true)
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password_confirmation
      expect  do
        click_button '新規登録'
      end.to change { User.count }.by(0)
      expect(page).to have_content('新規登録')
    end
  end
end

RSpec.describe 'ログイン機能', type: :system do
  before do
    @user = create(:user)
  end

  context 'ユーザーがログインできるとき' do
    it '正しい情報を入力するとログインすることができる' do
      visit root_path
      expect(page).to have_content('ログイン')
      click_on 'ログイン'
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      expect  do
        click_button 'ログイン'
      end.to change { User.count }.by(0)
      expect(page).to have_css '.user-image'
    end
  end

  context 'ユーザーがログインできないとき' do
    it 'Eメールとパスワードが空白のときログインできない' do
      visit root_path
      expect(page).to have_content('ログイン')
      click_on 'ログイン'
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      expect  do
        click_button 'ログイン'
      end.to change { User.count }.by(0)
      expect(page).to have_content('ログイン')
    end
  end

  context 'ユーザーがログインできないとき' do
    it 'Eメールが空白のときログインできない' do
      visit root_path
      expect(page).to have_content('ログイン')
      click_on 'ログイン'
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: @user.password
      expect  do
        click_button 'ログイン'
      end.to change { User.count }.by(0)
      expect(page).to have_content('ログイン')
    end
  end

  context 'ユーザーがログインできないとき' do
    it 'パスワードが空白のときログインできない' do
      visit root_path
      expect(page).to have_content('ログイン')
      click_on 'ログイン'
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: ''
      expect  do
        click_button 'ログイン'
      end.to change { User.count }.by(0)
      expect(page).to have_content('ログイン')
    end
  end

  context 'ユーザーがログインできないとき' do
    it 'Eメールが異なるときログインできない' do
      @user.email = 'mgeae@gmail.com'
      visit root_path
      expect(page).to have_content('ログイン')
      click_on 'ログイン'
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      expect  do
        click_button 'ログイン'
      end.to change { User.count }.by(0)
      expect(page).to have_content('ログイン')
    end
  end

  context 'ユーザーがログインできないとき' do
    it 'パスワードが異なるときログインできない' do
      @user.password = 'dmtel35l'
      visit root_path
      expect(page).to have_content('ログイン')
      click_on 'ログイン'
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      expect  do
        click_button 'ログイン'
      end.to change { User.count }.by(0)
      expect(page).to have_content('ログイン')
    end
  end
end

RSpec.describe 'アカウント情報編集', type: :system do
  before do
    @user = build(:user)
  end
  it '正しい情報を入力するとアカウント情報を編集できる' do
    sign_up(@user)
    find('.user-image').click
    click_on 'アカウント編集'
    expect(current_path).to eq edit_user_registration_path

    # 入力内容の再設定
    @user = build(:user)

    fill_in 'user_name', with: @user.name
    fill_in 'user_profile', with: @user.profile
    image_path = Rails.root.join('app/assets/images/0116.png')
    attach_file('user[image]', image_path, make_visible: true)
    fill_in 'user_email', with: @user.email
    expect  do
      click_button 'アカウント編集'
    end.to change { User.count }.by(0)
    expect(current_path).to eq root_path
    find('.user-image').click
    click_on 'アカウント編集'
    expect(page).to have_field 'user[name]', with: @user.name
    expect(page).to have_field 'user[profile]', with: @user.profile
    expect(page).to have_field 'user[email]', with: @user.email
  end

  context 'ユーザーがアカウント情報を編集できないとき' do
    it 'ニックネームが空白のときアカウント情報を編集できない' do
      sign_up(@user)
      find('.user-image').click
      click_on 'アカウント編集'
      expect(current_path).to eq edit_user_registration_path

      # 入力内容の再設定
      @user = build(:user)

      fill_in 'user_name', with: ''
      fill_in 'user_profile', with: @user.profile
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('user[image]', image_path, make_visible: true)
      fill_in 'user_email', with: @user.email
      expect  do
        click_button 'アカウント編集'
      end.to change { User.count }.by(0)
      expect(page).to have_content 'アカウント編集'
      expect(page).to have_content('ニックネームを入力してください。')
    end

    it 'Eメールが空白のときアカウント情報を編集できない' do
      sign_up(@user)
      find('.user-image').click
      click_on 'アカウント編集'
      expect(current_path).to eq edit_user_registration_path

      # 入力内容の再設定
      @user = build(:user)

      fill_in 'user_name', with: @user.name
      fill_in 'user_profile', with: @user.profile
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('user[image]', image_path, make_visible: true)
      fill_in 'user_email', with: ''
      expect  do
        click_button 'アカウント編集'
      end.to change { User.count }.by(0)
      expect(page).to have_content 'アカウント編集'
      expect(page).to have_content('Eメールを入力してください。')
    end
  end
end
