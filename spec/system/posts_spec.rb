require 'rails_helper'

RSpec.describe "投稿機能", type: :system do
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
      fill_in 'post_region', with: @post.region
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
      fill_in 'post_region', with: @post.region
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
      fill_in 'post_region', with: @post.region
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
      fill_in 'post_region', with: @post.region
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
      fill_in 'post_region', with: @post.region
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
      fill_in 'post_region', with: @post.region
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
      fill_in 'post_region', with: @post.region
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
      fill_in 'post_region', with: ""
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
      fill_in 'post_region', with: @post.region
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
      fill_in 'post_region', with: @post.region
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
      fill_in 'post_region', with: @post.region
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

RSpec.describe "投稿機能", type: :system do
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
      fill_in 'post_region', with: @post.region
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
      fill_in 'post_region', with: @post.region
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
      fill_in 'post_region', with: @post.region
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
      fill_in 'post_region', with: @post.region
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
      fill_in 'post_region', with: @post.region
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
      fill_in 'post_region', with: @post.region
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
      fill_in 'post_region', with: @post.region
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
      fill_in 'post_region', with: ""
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
      fill_in 'post_region', with: @post.region
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
      fill_in 'post_region', with: @post.region
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
      fill_in 'post_region', with: @post.region
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