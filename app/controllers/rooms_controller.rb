class RoomsController < ApplicationController
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    end
  end

  def index
    @user = User.find_by(id: current_user.id)
  end

  private

  def room_params
    params.require(:room).permit(user_ids: [])
  end
end
