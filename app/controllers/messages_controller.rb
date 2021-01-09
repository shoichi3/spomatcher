class MessagesController < ApplicationController
  def index
    @user = User.find_by(id: current_user.id)
    @rooms = @user.rooms
    @room = Room.find(params[:room_id])
    @message_partner = @room.users.where.not(id: current_user.id).first
    @message = Message.new
  end

  def create
    message = Message.create(message_params)
    render json:{message: message}
  end

  private

  def message_params
    params.require(:message).permit(:text, :image).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
