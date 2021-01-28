class Review < ApplicationRecord
  belongs_to :reviewer, class_name: "User", foreign_key: "reviewer_id"
  belongs_to :reviewee, class_name: "User", foreign_key: "reviewee_id"
  has_many :notifications

  validates :score, presence: true
  validates :content, presence: true

  def create_notification_review!(current_user, user)
    notification = current_user.active_notifications.new(
      visited_id: user.id,
      action: 'review'
    )
    notification.save if notification.valid?
  end
end
