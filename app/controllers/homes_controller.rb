class HomesController < ApplicationController

  def index
    if user_signed_in?
      @user = User.find_by(id: current_user.id)
    end
    @posts = Post.all.includes([:user, :tags]).page(params[:page]).per(5).order(created_at: "DESC")
  end
end
