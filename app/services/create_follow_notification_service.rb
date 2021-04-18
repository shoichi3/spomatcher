module CreateFollowNotificationService
  def create_notification_follow!(current_user)
    temp = Notification.where(['visitor_id = ? and visited_id = ? and action = ? ', current_user.id, id, 'follow'])
    return unless temp.blank?

    notification = current_user.active_notifications.new(
      visited_id: id,
      action: 'follow'
    )
    notification.save if notification.valid?
  end
end