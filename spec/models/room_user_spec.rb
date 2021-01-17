require 'rails_helper'

RSpec.describe RoomUser, type: :model do
  before do
    @room_user1 = build(:room_user)
    @room_user2 = create(:room_user)
    @room = build(:room)
    @user = build(:user)
  end

  describe 'メッセージルーム作成機能' do
    it 'ユーザーとルームがあれば保存されること' do
      expect(@room_user1).to be_valid
    end

    it '1つのルームに同じユーザーが2回以上保存されないこと' do
      @room_user2.valid?
    end

    it 'ユーザーが空のとき保存されないこと' do
      @room.valid?
    end

    it 'ルームが空のとき保存されないこと' do
      @user.valid?
    end
  end
end
