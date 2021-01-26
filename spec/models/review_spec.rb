require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = build(:review)
  end
   
  describe 'レビュー機能' do
    it '正しい値が入力されると保存することができること' do
      expect(@review).to be_valid
    end

    it 'レビュー内容が空白のとき、保存できないこと' do
      @review.content = nil
      @review.valid?
      expect(@review.errors.full_messages).to include('レビューを入力してください。')
    end

    it '評価が空白のとき、保存できないこと' do
      @review.score = nil
      @review.valid?
      expect(@review.errors.full_messages).to include('評価を入力してください。')
    end

    it 'revieweeが空白のとき、保存できないこと' do
      @review.reviewer_id = nil
      @review.valid?
    end

    it 'reviewerが空白のとき、保存できないこと' do
      @review.reviewee_id = nil
      @review.valid?
    end
  end
end
