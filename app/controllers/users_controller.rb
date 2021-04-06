class UsersController < ApplicationController
  before_action :set_post_user
  
  def show
    if user_signed_in?
      @user = User.find_by(id: current_user.id)
      @current_user_room = RoomUser.where(user_id: @user.id)
      @post_user_room = RoomUser.where(user_id: @post_user.id)
      @current_user_room.each do |cu|
        @post_user_room.each do |po|
          if cu.room_id == po.room_id
            @have_room = true
            @room_id = cu.room_id
          end
        end
      end
      @room = Room.new unless @have_room
    end
    @posts = @post_user.posts.order(created_at: 'DESC')
    @favorites = @post_user.favorites.includes(:user).order(created_at: 'DESC')
  end

  private

  def set_post_user
    @post_user = User.find(params[:id])
  end
end
