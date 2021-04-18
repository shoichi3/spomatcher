class Review < ApplicationRecord
  include CreateReviewNotificationService
  
  belongs_to :reviewer, class_name: 'User', foreign_key: 'reviewer_id'
  belongs_to :reviewee, class_name: 'User', foreign_key: 'reviewee_id'
  has_many :notifications, dependent: :destroy

  validates :score, presence: true
  validates :content, presence: true

end
