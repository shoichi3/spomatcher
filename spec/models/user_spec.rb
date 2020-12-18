require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
    @user.image = fixture_file_upload('app/assets/images/default.png')
  end
  
  describe 'ユーザー管理機能' do
    it '全ての項目が正しく入力されたとき登録できる' do
      expect(@user).to be_valid
    end

    it '自己紹介およびプロフィール画像が空白のとき登録できる' do
      @user.profile = nil
      @user.image = nil
      expect(@user).to be_valid
    end

    it '自己紹介が空白のとき登録できる' do
      @user.profile = nil
      expect(@user).to be_valid
    end

    it 'プロフィール画像が空白のとき登録できる' do
      @user.image = nil
      expect(@user).to be_valid
    end
    
    it 'ニックネームが空白のとき登録できない' do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください。")
    end

    it 'Eメールが空白のとき登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください。")
    end

    it 'パスワードが空白のとき登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください。")
    end

    it 'パスワード（確認用）が空白のとき登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません。")
    end

    it '重複したEメールは登録できない' do
      @user.save
      anothor_user = build(:user, email: @user.email)
      anothor_user.valid?
      expect(anothor_user.errors.full_messages).to include("Eメールはすでに存在します。")
    end

    it 'パスワードが5文字以下のとき登録できない' do
      @user.password = 'aent4'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください。")
    end

    it 'パスワードがアルファベットのみのとき登録できない' do
      @user.password = 'aentterye'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには半角英数字の両方が必要です。")
    end

    it 'パスワードが数字のみのとき登録できない' do
      @user.password = '6435678'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには半角英数字の両方が必要です。")
    end

    it 'パスワードに全角文字が用いられているとき登録できない' do
      @user.password = 'ejtｒ3５あyr'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには半角英数字の両方が必要です。")
    end
  end
end

