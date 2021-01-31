class HomesController < ApplicationController

  def index
    if user_signed_in?
      @user = User.find_by(id: current_user.id)
    end
    @posts = Post.all.includes([:user, :tags]).page(params[:page]).per(5).order(created_at: "DESC")
    if @tag = params[:tag]
      @post = Post.tagged_with(params[:tag]).page(params[:page]).per(5).order(created_at: "DESC")
    end
  end
end
