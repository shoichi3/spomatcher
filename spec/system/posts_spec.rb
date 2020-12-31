require 'rails_helper'

RSpec.describe "投稿機能(サインイン後)", type: :system do
  before do
    @post = build(:post)
  end

  context 'サインイン後、ユーザーが新規投稿できるとき' do
    it '正しい情報を入力すると、新規投稿することができる' do
      sign_up(@post.user)
      post(@post)
    end

    it 'タグと定期開催日が空白のときでも、新規投稿することができる' do
      sign_up(@post.user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: @post.title
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      fill_in 'post_tag_list', with: ""
      fill_in 'post_sports', with: @post.sports
      fill_in 'post_datetime', with: @post.datetime
      fill_in 'post_regular_date', with: ""
      fill_in 'post_address', with: @post.address
      fill_in 'post_cost', with: @post.cost
      fill_in 'post_content', with: @post.content
      fill_in 'post_flow', with: @post.flow
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(1)
      expect(current_path).to eq root_path
      expect(page).to have_content @post.title
      expect(page).to_not have_content @post.tag_list
      expect(page).to_not have_content @post.regular_date
    end

    it 'タグが空白のときでも、新規投稿することができる' do
      sign_up(@post.user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: @post.title
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      fill_in 'post_tag_list', with: ""
      fill_in 'post_sports', with: @post.sports
      fill_in 'post_datetime', with: @post.datetime
      fill_in 'post_regular_date', with: @post.regular_date
      fill_in 'post_address', with: @post.address
      fill_in 'post_cost', with: @post.cost
      fill_in 'post_content', with: @post.content
      fill_in 'post_flow', with: @post.flow
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(1)
      expect(current_path).to eq root_path
      expect(page).to have_content @post.title
      expect(page).to_not have_content @post.tag_list
    end

    it '定期開催日が空白のときでも、新規投稿することができる' do
      sign_up(@post.user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: @post.title
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      fill_in 'post_tag_list', with: @post.tag_list
      fill_in 'post_sports', with: @post.sports
      fill_in 'post_datetime', with: @post.datetime
      fill_in 'post_regular_date', with: ""
      fill_in 'post_address', with: @post.address
      fill_in 'post_cost', with: @post.cost
      fill_in 'post_content', with: @post.content
      fill_in 'post_flow', with: @post.flow
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(1)
      expect(current_path).to eq root_path
      expect(page).to have_content @post.title
      expect(page).to_not have_content @post.regular_date
    end
  end

  context 'サインイン後、ユーザーが新規投稿できないとき' do
    it 'タイトルが空白のとき、新規投稿できない' do
      sign_up(@post.user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: ""
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      fill_in 'post_tag_list', with: @post.tag_list
      fill_in 'post_sports', with: @post.sports
      fill_in 'post_datetime', with: @post.datetime
      fill_in 'post_regular_date', with: @post.regular_date
      fill_in 'post_address', with: @post.address
      fill_in 'post_cost', with: @post.cost
      fill_in 'post_content', with: @post.content
      fill_in 'post_flow', with: @post.flow
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('タイトルを入力してください。')
    end

    it '画像を選択しないのとき、新規投稿できない' do
      sign_up(@post.user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: @post.title
      fill_in 'post_tag_list', with: @post.tag_list
      fill_in 'post_sports', with: @post.sports
      fill_in 'post_datetime', with: @post.datetime
      fill_in 'post_regular_date', with: @post.regular_date
      fill_in 'post_address', with: @post.address
      fill_in 'post_cost', with: @post.cost
      fill_in 'post_content', with: @post.content
      fill_in 'post_flow', with: @post.flow
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('画像を選択してください。')
    end

    it '競技名が空白のとき、新規投稿できない' do
      sign_up(@post.user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: @post.title
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      fill_in 'post_tag_list', with: @post.tag_list
      fill_in 'post_sports', with: ""
      fill_in 'post_datetime', with: @post.datetime
      fill_in 'post_regular_date', with: @post.regular_date
      fill_in 'post_address', with: @post.address
      fill_in 'post_cost', with: @post.cost
      fill_in 'post_content', with: @post.content
      fill_in 'post_flow', with: @post.flow
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('競技名を入力してください。')
    end

    it '日時が空白のとき、新規投稿できない' do
      sign_up(@post.user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: @post.title
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      fill_in 'post_tag_list', with: @post.tag_list
      fill_in 'post_sports', with: @post.sports
      fill_in 'post_datetime', with: ""
      fill_in 'post_regular_date', with: @post.regular_date
      fill_in 'post_address', with: @post.address
      fill_in 'post_cost', with: @post.cost
      fill_in 'post_content', with: @post.content
      fill_in 'post_flow', with: @post.flow
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('日時を入力してください。')
    end

    it '場所が空白のとき、新規投稿できない' do
      sign_up(@post.user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: @post.title
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      fill_in 'post_tag_list', with: @post.tag_list
      fill_in 'post_sports', with: @post.sports
      fill_in 'post_datetime', with: @post.datetime
      fill_in 'post_regular_date', with: @post.regular_date
      fill_in 'post_address', with: ""
      fill_in 'post_cost', with: @post.cost
      fill_in 'post_content', with: @post.content
      fill_in 'post_flow', with: @post.flow
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('場所を入力してください。')
    end

    it '参加費が空白のとき、新規投稿できない' do
      sign_up(@post.user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: @post.title
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      fill_in 'post_tag_list', with: @post.tag_list
      fill_in 'post_sports', with: @post.sports
      fill_in 'post_datetime', with: @post.datetime
      fill_in 'post_regular_date', with: @post.regular_date
      fill_in 'post_address', with: @post.address
      fill_in 'post_cost', with: ""
      fill_in 'post_content', with: @post.content
      fill_in 'post_flow', with: @post.flow
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('参加費を入力してください。')
    end

    it 'メッセージが空白のとき、新規投稿できない' do
      sign_up(@post.user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: @post.title
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      fill_in 'post_tag_list', with: @post.tag_list
      fill_in 'post_sports', with: @post.sports
      fill_in 'post_datetime', with: @post.datetime
      fill_in 'post_regular_date', with: @post.regular_date
      fill_in 'post_address', with: @post.address
      fill_in 'post_cost', with: @post.cost
      fill_in 'post_content', with: ""
      fill_in 'post_flow', with: @post.flow
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('メッセージを入力してください。')
    end

    it '当日の流れが空白のとき、新規投稿できない' do
      sign_up(@post.user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: @post.title
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      fill_in 'post_tag_list', with: @post.tag_list
      fill_in 'post_sports', with: @post.sports
      fill_in 'post_datetime', with: @post.datetime
      fill_in 'post_regular_date', with: @post.regular_date
      fill_in 'post_address', with: @post.address
      fill_in 'post_cost', with: @post.cost
      fill_in 'post_content', with: @post.content
      fill_in 'post_flow', with: ""
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('当日の流れを入力してください。')
    end
  end
end

RSpec.describe "投稿機能(ログイン後)", type: :system do
  before do
    @user = create(:user)
    @post = build(:post)
  end

  context 'ログイン後、ユーザーが新規投稿できるとき' do
    it '正しい情報を入力すると、新規投稿することができる' do
      log_in(@user)
      post(@post)
    end

    it 'タグと定期開催日が空白のときでも、新規投稿することができる' do
      log_in(@user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: @post.title
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      fill_in 'post_tag_list', with: ""
      fill_in 'post_sports', with: @post.sports
      fill_in 'post_datetime', with: @post.datetime
      fill_in 'post_regular_date', with: ""
      fill_in 'post_address', with: @post.address
      fill_in 'post_cost', with: @post.cost
      fill_in 'post_content', with: @post.content
      fill_in 'post_flow', with: @post.flow
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(1)
      expect(current_path).to eq root_path
      expect(page).to have_content @post.title
      expect(page).to_not have_content @post.tag_list
      expect(page).to_not have_content @post.regular_date
    end

    it 'タグが空白のときでも、新規投稿することができる' do
      log_in(@user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: @post.title
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      fill_in 'post_tag_list', with: ""
      fill_in 'post_sports', with: @post.sports
      fill_in 'post_datetime', with: @post.datetime
      fill_in 'post_regular_date', with: @post.regular_date
      fill_in 'post_address', with: @post.address
      fill_in 'post_cost', with: @post.cost
      fill_in 'post_content', with: @post.content
      fill_in 'post_flow', with: @post.flow
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(1)
      expect(current_path).to eq root_path
      expect(page).to have_content @post.title
      expect(page).to_not have_content @post.tag_list
    end

    it '定期開催日が空白のときでも、新規投稿することができる' do
      log_in(@user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: @post.title
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      fill_in 'post_tag_list', with: @post.tag_list
      fill_in 'post_sports', with: @post.sports
      fill_in 'post_datetime', with: @post.datetime
      fill_in 'post_regular_date', with: ""
      fill_in 'post_address', with: @post.address
      fill_in 'post_cost', with: @post.cost
      fill_in 'post_content', with: @post.content
      fill_in 'post_flow', with: @post.flow
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(1)
      expect(current_path).to eq root_path
      expect(page).to have_content @post.title
      expect(page).to_not have_content @post.regular_date
    end
  end

  context 'ログイン後、ユーザーが新規投稿できないとき' do
    it 'タイトルが空白のとき、新規投稿できない' do
      log_in(@user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: ""
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      fill_in 'post_tag_list', with: @post.tag_list
      fill_in 'post_sports', with: @post.sports
      fill_in 'post_datetime', with: @post.datetime
      fill_in 'post_regular_date', with: @post.regular_date
      fill_in 'post_address', with: @post.address
      fill_in 'post_cost', with: @post.cost
      fill_in 'post_content', with: @post.content
      fill_in 'post_flow', with: @post.flow
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('タイトルを入力してください。')
    end

    it '画像を選択しないのとき、新規投稿できない' do
      log_in(@user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: @post.title
      fill_in 'post_tag_list', with: @post.tag_list
      fill_in 'post_sports', with: @post.sports
      fill_in 'post_datetime', with: @post.datetime
      fill_in 'post_regular_date', with: @post.regular_date
      fill_in 'post_address', with: @post.address
      fill_in 'post_cost', with: @post.cost
      fill_in 'post_content', with: @post.content
      fill_in 'post_flow', with: @post.flow
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('画像を選択してください。')
    end

    it '競技名が空白のとき、新規投稿できない' do
      log_in(@user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: @post.title
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      fill_in 'post_tag_list', with: @post.tag_list
      fill_in 'post_sports', with: ""
      fill_in 'post_datetime', with: @post.datetime
      fill_in 'post_regular_date', with: @post.regular_date
      fill_in 'post_address', with: @post.address
      fill_in 'post_cost', with: @post.cost
      fill_in 'post_content', with: @post.content
      fill_in 'post_flow', with: @post.flow
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('競技名を入力してください。')
    end

    it '日時が空白のとき、新規投稿できない' do
      log_in(@user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: @post.title
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      fill_in 'post_tag_list', with: @post.tag_list
      fill_in 'post_sports', with: @post.sports
      fill_in 'post_datetime', with: ""
      fill_in 'post_regular_date', with: @post.regular_date
      fill_in 'post_address', with: @post.address
      fill_in 'post_cost', with: @post.cost
      fill_in 'post_content', with: @post.content
      fill_in 'post_flow', with: @post.flow
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('日時を入力してください。')
    end

    it '場所が空白のとき、新規投稿できない' do
      log_in(@user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: @post.title
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      fill_in 'post_tag_list', with: @post.tag_list
      fill_in 'post_sports', with: @post.sports
      fill_in 'post_datetime', with: @post.datetime
      fill_in 'post_regular_date', with: @post.regular_date
      fill_in 'post_address', with: ""
      fill_in 'post_cost', with: @post.cost
      fill_in 'post_content', with: @post.content
      fill_in 'post_flow', with: @post.flow
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('場所を入力してください。')
    end

    it '参加費が空白のとき、新規投稿できない' do
      log_in(@user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: @post.title
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      fill_in 'post_tag_list', with: @post.tag_list
      fill_in 'post_sports', with: @post.sports
      fill_in 'post_datetime', with: @post.datetime
      fill_in 'post_regular_date', with: @post.regular_date
      fill_in 'post_address', with: @post.address
      fill_in 'post_cost', with: ""
      fill_in 'post_content', with: @post.content
      fill_in 'post_flow', with: @post.flow
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('参加費を入力してください。')
    end

    it 'メッセージが空白のとき、新規投稿できない' do
      log_in(@user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: @post.title
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      fill_in 'post_tag_list', with: @post.tag_list
      fill_in 'post_sports', with: @post.sports
      fill_in 'post_datetime', with: @post.datetime
      fill_in 'post_regular_date', with: @post.regular_date
      fill_in 'post_address', with: @post.address
      fill_in 'post_cost', with: @post.cost
      fill_in 'post_content', with: ""
      fill_in 'post_flow', with: @post.flow
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('メッセージを入力してください。')
    end

    it '当日の流れが空白のとき、新規投稿できない' do
      log_in(@user)
      find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: @post.title
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      fill_in 'post_tag_list', with: @post.tag_list
      fill_in 'post_sports', with: @post.sports
      fill_in 'post_datetime', with: @post.datetime
      fill_in 'post_regular_date', with: @post.regular_date
      fill_in 'post_address', with: @post.address
      fill_in 'post_cost', with: @post.cost
      fill_in 'post_content', with: @post.content
      fill_in 'post_flow', with: ""
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('当日の流れを入力してください。')
    end
  end
end

RSpec.describe '投稿編集機能(サインイン後)', type: :system do
  before do
    @post1 = build(:post)
    @post2 = build(:post)
  end
  
  context 'サインイン後ユーザーが新規投稿し、それを編集することができる' do
    it '正しい情報を入力すると、投稿を編集することができる' do
      sign_up(@post1.user)
      post(@post1)
      find('.post-link').click
      click_on '投稿を編集'
      fill_in 'post_title', with: "#{@post1.title} + 編集した内容"
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      expect{
        click_on '編集する'
      }.to change { Post.count }.by(1)
      expect(current_path).to eq root_path
      expect(page).to have_content("#{@post1.title} + 編集した内容")
    end
  end

  context '投稿を編集する際、空欄の箇所がある場合編集することができない' do
    it 'タイトルが空欄の場合,投稿を編集することができない' do
      sign_up(@post1.user)
      post(@post1)
      find('.post-link').click
      click_on '投稿を編集'
      fill_in 'post_title', with: ""
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      expect{
        click_on '編集する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('タイトルを入力してください。')
    end

    it '画像が空欄の場合,投稿を編集することができない' do
      sign_up(@post1.user)
      post(@post1)
      find('.post-link').click
      click_on '投稿を編集'
      expect{
        click_on '編集する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('画像を選択してください。')
    end

    it 'メッセージが空欄の場合,投稿を編集することができない' do
      sign_up(@post1.user)
      post(@post1)
      find('.post-link').click
      click_on '投稿を編集'
      fill_in 'post_content', with: ""
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      expect{
        click_on '編集する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('メッセージを入力してください。')
    end

    it '当日の流れが空欄の場合,投稿を編集することができない' do
      sign_up(@post1.user)
      post(@post1)
      find('.post-link').click
      click_on '投稿を編集'
      fill_in 'post_flow', with: ""
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      expect{
        click_on '編集する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('当日の流れを入力してください。')
    end

    it '競技名が空欄の場合,投稿を編集することができない' do
      sign_up(@post1.user)
      post(@post1)
      find('.post-link').click
      click_on '投稿を編集'
      fill_in 'post_sports', with: ""
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      expect{
        click_on '編集する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('競技名を入力してください。')
    end

    it '日時が空欄の場合,投稿を編集することができない' do
      sign_up(@post1.user)
      post(@post1)
      find('.post-link').click
      click_on '投稿を編集'
      fill_in 'post_datetime', with: ""
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      expect{
        click_on '編集する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('日時を入力してください。')
    end

    it '場所が空欄の場合,投稿を編集することができない' do
      sign_up(@post1.user)
      post(@post1)
      find('.post-link').click
      click_on '投稿を編集'
      fill_in 'post_address', with: ""
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      expect{
        click_on '編集する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('場所を入力してください。')
    end

    it '参加費が空欄の場合,投稿を編集することができない' do
      sign_up(@post1.user)
      post(@post1)
      find('.post-link').click
      click_on '投稿を編集'
      fill_in 'post_cost', with: ""
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      expect{
        click_on '編集する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('参加費を入力してください。')
    end
  end

  context '他のユーザーの投稿は編集できない' do
    it '他のユーザーの投稿の詳細ページには編集ボタンが存在しない' do
      sign_up(@post1.user)
      post(@post1)
      find('.user-image').click
      click_on 'ログアウト'
      expect(page).to have_content('新規登録')
      sign_up(@post2.user)
      find('.post-link').click
      expect(page).to_not have_content('投稿を編集')
    end
  end
end

RSpec.describe '投稿編集機能(ログイン後)', type: :system do
  before do
    @post1 = build(:post)
    @post2 = build(:post)
  end

  context 'ログイン後ユーザーが新規投稿し、それを編集することができる' do
    it '正しい情報を入力すると、投稿を編集することができる' do
      sign_up(@post1.user)
      find('.user-image').click
      click_on 'ログアウト'
      log_in(@post1.user)
      post(@post1)
      find('.post-link').click
      click_on '投稿を編集'
      fill_in 'post_title', with: "#{@post1.title} + 編集した内容"
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      expect{
        click_on '編集する'
      }.to change { Post.count }.by(1)
      expect(current_path).to eq root_path
      expect(page).to have_content("#{@post1.title} + 編集した内容")
    end
  end

  context '投稿を編集する際、空欄の箇所がある場合編集することができない' do
    it 'タイトルが空欄の場合,投稿を編集することができない' do
      sign_up(@post1.user)
      find('.user-image').click
      click_on 'ログアウト'
      log_in(@post1.user)
      post(@post1)
      find('.post-link').click
      click_on '投稿を編集'
      fill_in 'post_title', with: ""
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      expect{
        click_on '編集する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('タイトルを入力してください。')
    end

    it '画像が空欄の場合,投稿を編集することができない' do
      sign_up(@post1.user)
      find('.user-image').click
      click_on 'ログアウト'
      log_in(@post1.user)
      post(@post1)
      find('.post-link').click
      click_on '投稿を編集'
      expect{
        click_on '編集する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('画像を選択してください。')
    end

    it 'メッセージが空欄の場合,投稿を編集することができない' do
      sign_up(@post1.user)
      find('.user-image').click
      click_on 'ログアウト'
      log_in(@post1.user)
      post(@post1)
      find('.post-link').click
      click_on '投稿を編集'
      fill_in 'post_content', with: ""
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      expect{
        click_on '編集する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('メッセージを入力してください。')
    end

    it '当日の流れが空欄の場合,投稿を編集することができない' do
      sign_up(@post1.user)
      find('.user-image').click
      click_on 'ログアウト'
      log_in(@post1.user)
      post(@post1)
      find('.post-link').click
      click_on '投稿を編集'
      fill_in 'post_flow', with: ""
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      expect{
        click_on '編集する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('当日の流れを入力してください。')
    end

    it '競技名が空欄の場合,投稿を編集することができない' do
      sign_up(@post1.user)
      find('.user-image').click
      click_on 'ログアウト'
      log_in(@post1.user)
      post(@post1)
      find('.post-link').click
      click_on '投稿を編集'
      fill_in 'post_sports', with: ""
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      expect{
        click_on '編集する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('競技名を入力してください。')
    end

    it '日時が空欄の場合,投稿を編集することができない' do
      sign_up(@post1.user)
      find('.user-image').click
      click_on 'ログアウト'
      log_in(@post1.user)
      post(@post1)
      find('.post-link').click
      click_on '投稿を編集'
      fill_in 'post_datetime', with: ""
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      expect{
        click_on '編集する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('日時を入力してください。')
    end

    it '場所が空欄の場合,投稿を編集することができない' do
      sign_up(@post1.user)
      find('.user-image').click
      click_on 'ログアウト'
      log_in(@post1.user)
      post(@post1)
      find('.post-link').click
      click_on '投稿を編集'
      fill_in 'post_address', with: ""
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      expect{
        click_on '編集する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('場所を入力してください。')
    end

    it '参加費が空欄の場合,投稿を編集することができない' do
      sign_up(@post1.user)
      find('.user-image').click
      click_on 'ログアウト'
      log_in(@post1.user)
      post(@post1)
      find('.post-link').click
      click_on '投稿を編集'
      fill_in 'post_cost', with: ""
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      expect{
        click_on '編集する'
      }.to change { Post.count }.by(0)
      expect(page).to have_content('参加費を入力してください。')
    end
  end

  context 'ログイン後、他ユーザーの投稿を編集することができない' do
    it '正しい情報を入力すると、投稿を編集することができる' do
      sign_up(@post1.user)
      post(@post1)
      find('.user-image').click
      click_on 'ログアウト'
      sign_up(@post2.user)
      find('.user-image').click
      click_on 'ログアウト'
      log_in(@post2.user)
      find('.post-link').click
      expect(page).to_not have_content('投稿を編集')
    end
  end
end

RSpec.describe '投稿削除機能(サインイン後)', type: :system do
  before do
    @post1 = build(:post)
    @post2 = build(:post)
  end

  context '自分が投稿した投稿なら削除することができる' do
    it '自分の投稿なら削除ボタンを押すと、削除することができる' do
      sign_up(@post1.user)
      post(@post1)
      find('.post-link').click
      expect{
        click_on '投稿を削除'
      }.to change { Post.count }.by(-1)
      expect(current_path).to eq root_path
      expect(page).to_not have_content("#{@post1.title} + 編集した内容")
    end
  end

  context '他のユーザーの投稿は削除できない' do
    it '他のユーザーの投稿の詳細ページには削除ボタンが存在しない' do
      sign_up(@post1.user)
      post(@post1)
      find('.user-image').click
      click_on 'ログアウト'
      expect(page).to have_content('新規登録')
      sign_up(@post2.user)
      find('.post-link').click
      expect(page).to_not have_content('投稿を削除')
    end
  end
end

RSpec.describe '投稿削除機能(ログイン後)', type: :system do
  before do
    @post1 = build(:post)
    @post2 = build(:post)
  end

  context '自分が投稿した投稿なら削除することができる' do
    it '自分の投稿なら削除ボタンを押すと、削除することができる' do
      sign_up(@post1.user)
      post(@post1)
      find('.user-image').click
      click_on 'ログアウト'
      log_in(@post1.user)
      find('.post-link').click
      expect{
        click_on '投稿を削除'
      }.to change { Post.count }.by(-1)
      expect(current_path).to eq root_path
      expect(page).to_not have_content("#{@post1.title} + 編集した内容")
    end
  end

  context '他のユーザーの投稿は削除できない' do
    it '他のユーザーの投稿の詳細ページには削除ボタンが存在しない' do
      sign_up(@post1.user)
      post(@post1)
      find('.user-image').click
      click_on 'ログアウト'
      sign_up(@post2.user)
      find('.user-image').click
      click_on 'ログアウト'
      log_in(@post2.user)
      find('.post-link').click
      expect(page).to_not have_content("投稿を削除")
    end
  end
end