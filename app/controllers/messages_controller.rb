class MessagesController < ApplicationController
  def index
    @user = User.find_by(id: current_user.id)
    @rooms = @user.rooms
    @room = Room.find(params[:room_id])
    @message_partner = @room.users.where.not(id: current_user.id).first
    @message = Message.new
    @messages = @room.messages.includes(:user)
    @last_message = @room.messages.includes(:user).order(created_at: :desc).limit(1)
  end

  def create
    message = Message.create(message_params)
    send_user = message.user
    render json:{ message: message, user: send_user }
  end

  private

  def message_params
    params.require(:message).permit(:text, :image).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
