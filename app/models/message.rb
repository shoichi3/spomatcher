class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one_attached :image

  def create_notification_message!(current_user, user, room)
    notification = current_user.active_notifications.new(
      visited_id: user.id,
      room_id: room.id,
      action: "message"
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
