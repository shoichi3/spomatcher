require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = build(:message)
    @message.image = fixture_file_upload('app/assets/images/default.png')
  end

  describe 'メッセージ機能' do
    it 'テキストと画像が存在するとき保存されること' do
      expect(@message).to be_valid
    end

    it 'テキストが空白のとき保存されること' do
      @message.text = nil
      expect(@message).to be_valid
    end

    it '画像が空白のとき保存されること' do
      @message.image = nil
      expect(@message).to be_valid
    end
  end
end
