class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:followings, :followers, :destroy]

  def followings
    if user_signed_in?
      @user = User.find_by(id: current_user.id)
    end
    @followings = @postUser.followings
    @followers = @postUser.followers
  end

  def followers
    if user_signed_in?
      @user = User.find_by(id: current_user.id)
    end
    @followings = @postUser.followings
    @followers = @postUser.followers
  end

  def create
    @following_user = User.find(params[:following_id])
    current_user.follow(@following_user)
    @following_user.create_notification_follow!(current_user)
  end

  def destroy
    current_user.unfollow(@postUser)
  end

  private

  def set_user
    @postUser = User.find(params[:id])
  end
end
