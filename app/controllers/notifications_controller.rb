class NotificationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @notifications = current_user.passive_notifications.order(created_at: "DESC")
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
    @user = User.find_by(id: current_user.id)
  end
end
