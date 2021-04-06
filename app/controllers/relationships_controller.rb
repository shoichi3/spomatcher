class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:followings, :followers, :destroy]
  before_action :set_follow, only: [:followings, :followers]

  def followings
  end

  def followers
  end

  def create
    @following_user = User.find(params[:following_id])
    current_user.follow(@following_user)
    @following_user.create_notification_follow!(current_user)
  end

  def destroy
    current_user.unfollow(@post_user)
  end

  private

  def set_user
    @post_user = User.find(params[:id])
  end

  def set_follow
    @user = User.find_by(id: current_user.id) if user_signed_in?
    @followings = @post_user.followings
    @followers = @post_user.followers
  end
end
