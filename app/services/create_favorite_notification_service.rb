module CreateFavoriteNotificationService
  def create_notification_favorite!(current_user)
    temp = Notification.where(['visitor_id = ? and visited_id = ? and post_id = ? and action = ?', current_user.id, user_id, id,
                               'favorite'])
    return unless temp.blank?

    notification = current_user.active_notifications.new(
      visited_id: user_id,
      post_id: id,
      action: 'favorite'
    )
    notification.checked = true if notification.visitor_id == notification.visited_id
    notification.save if notification.valid?
  end
end
