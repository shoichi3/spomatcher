class HomesController < ApplicationController
  def index
    @user = User.find_by(id: current_user.id) if user_signed_in?
    @posts = Post.all.includes([:user, :tags]).page(params[:page]).per(5).order(created_at: 'DESC')
    @post = Post.tagged_with(params[:tag]).page(params[:page]).per(5).order(created_at: 'DESC') if @tag == params[:tag]
  end
end
