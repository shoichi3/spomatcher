module CreateReviewNotificationService
  def create_notification_review!(current_user, user)
    notification = current_user.active_notifications.new(
      visited_id: user.id,
      action: 'review'
    )
    notification.save if notification.valid?
  end
end