class MessagesController < ApplicationController
  def index
    @user = User.find_by(id: current_user.id)
    @rooms = @user.rooms
    @room = Room.find(params[:room_id])
    @message_partner = @room.users.where.not(id: current_user.id).first
    @message = Message.new
  end
end
