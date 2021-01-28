require 'rails_helper'

RSpec.describe Notification, type: :model do
  before do
    @notification = build(:notification)
  end

  describe '通知機能' do
    it 'メッセージが送信されたとき保存できること' do
      expect(@notification).to be_valid
    end
    
    it 'フォローされたとき保存できること' do
      @notification.action = "follow"
      expect(@notification).to be_valid
    end

    it '投稿がお気に入り登録されたとき保存できること' do
      @notification.action = "favorite"
      expect(@notification).to be_valid
    end

    it 'レビューが投稿されたとき保存できること' do
      @notification.action = "review"
      expect(@notification).to be_valid
    end

    it 'actionが空のとき保存されないこと' do
      @notification.action = nil
      @notification.valid?
    end
 
    it 'actionが適切な値ではないとき保存できないこと' do
      @notification.action = "like"
      @notification.valid?
    end

    it 'checkedが空のとき保存されないこと' do
      @notification.checked = nil
      @notification.valid?
    end

    it '送信者が空のとき保存されないこと' do
      @notification.visitor = nil
      @notification.valid?
    end

    it '受信者が空のとき保存されないこと' do
      @notification.visited = nil
      @notification.valid?
    end
  end
end
