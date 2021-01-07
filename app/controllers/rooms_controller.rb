class RoomsController < ApplicationController
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_messages_path(@room.id)
    end
  end

  private

  def room_params
    params.require(:room).permit(user_ids: [])
  end
end
