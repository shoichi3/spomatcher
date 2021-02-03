class UsersController < ApplicationController
  def show
    if user_signed_in?
      @user = User.find_by(id: current_user.id)
      @postUser = User.find(params[:id])
      @currentUserRoom = RoomUser.where(user_id: @user.id)
      @postUserRoom = RoomUser.where(user_id: @postUser.id)
      @currentUserRoom.each do |cu|
        @postUserRoom.each do |po|
          if cu.room_id == po.room_id
            @haveRoom = true
            @roomId = cu.room_id
          end
        end
      end
      unless @haveRoom
        @room = Room.new
      end
    end
    @postUser = User.find(params[:id])
    @posts = @postUser.posts.order(created_at: "DESC")
    @favorites = @postUser.favorites.includes(:user).order(created_at: "DESC")
  end
end
