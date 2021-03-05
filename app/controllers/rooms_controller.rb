class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find_by(id: current_user.id)
    @rooms = @user.rooms
  end

  def create
    @room = Room.new(room_params)
    redirect_to room_messages_path(@room.id) if @room.save
  end

  private

  def room_params
    params.require(:room).permit(user_ids: [])
  end
end
