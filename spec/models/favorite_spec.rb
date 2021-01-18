require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    @favorite1 = build(:favorite)
    @user = build(:user)
    @post = build(:post)
  end

  describe 'お気に入り機能' do
    it 'use_idとpost_idが存在すれば保存できること' do
      expect(@favorite1).to be_valid
    end

    it 'user_idが空のとき保存されないこと' do
      @user.valid?
    end

    it 'post_idが空のとき保存されないこと' do
      @post.valid?
    end
  end
end
