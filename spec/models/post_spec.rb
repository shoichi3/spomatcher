require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = build(:post)
    @post.image = fixture_file_upload('app/assets/images/default.png')
  end

  describe '新規投稿機能' do
    it '全ての項目が正しく入力されたとき投稿できる' do
      expect(@post).to be_valid
    end

    it 'タグと定期開催日が空白のとき登録できる' do
      @post.tag_list = nil
      @post.regular_date = nil
      expect(@post).to be_valid
    end

    it 'タグが空白のとき登録できる' do
      @post.tag_list = nil
      expect(@post).to be_valid
    end

    it '定期開催日が空白のとき登録できる' do
      @post.regular_date = nil
      expect(@post).to be_valid
    end

    it 'タイトルが空白のとき登録できない' do
      @post.title = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("タイトルを入力してください。")
    end

    it '画像が選択されていないとき登録できない' do
      @post.image = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("画像を選択してください。")
    end

    it '競技名が空白のとき登録できない' do
      @post.sports = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("競技名を入力してください。")
    end

    it '日時が空白のとき登録できない' do
      @post.datetime = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("日時を入力してください。")
    end
    
    it '場所が空白のとき登録できない' do
      @post.region = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("場所を入力してください。")
    end

    it '参加費が空白のとき登録できない' do
      @post.cost = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("参加費を入力してください。")
    end
    
    it 'メッセージが空白のとき登録できない' do
      @post.content = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("メッセージを入力してください。")
    end

    it '当日の流れが空白のとき登録できない' do
      @post.flow = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("当日の流れを入力してください。")
    end
  end
end
