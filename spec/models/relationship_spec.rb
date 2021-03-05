require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @follower = create(:user)
    @following = create(:user)
    @relationship1 = build(:relationship, follower: @follower, following: @following)
    @relationship2 = create(:relationship)
  end

  describe 'フォロー機能' do
    it 'followerとfollowingが存在すれば保存できること' do
      expect(@relationship1).to be_valid
    end

    it '同じfollowerとfollowingの組み合わせの場合、保存できないこと' do
      @relationship2.valid?
    end

    it 'followingが空のとき保存できないこと' do
      @follower.valid?
    end

    it 'followerが空のとき保存できないこと' do
      @following.valid?
    end
  end
end
