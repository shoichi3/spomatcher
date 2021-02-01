class MessagesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = User.find_by(id: current_user.id)
    @rooms = @user.rooms
    @room = Room.find(params[:room_id])
    @message_partner = @room.users.where.not(id: current_user.id).first
    @message = Message.new
    @messages = @room.messages.includes(:user)
  end

  def create
    @message = Message.new(message_params)
    @room = Room.find(params[:room_id])
    @user = @room.users.where.not(id: current_user.id).first
    if @message.save
      @message.create_notification_message!(current_user, @user, @room)
      respond_to do |format|
        format.json
      end
    else
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :image).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
