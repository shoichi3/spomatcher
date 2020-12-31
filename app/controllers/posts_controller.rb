class PostsController < ApplicationController

  def new
    if user_signed_in?
      @user = User.find_by(id: current_user.id)
    else
      redirect_to new_user_registration_path
    end
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      @user = User.find_by(id: current_user.id)
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find_by(id: current_user.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :tag_list, :sports, :datetime, :regular_date, :address, :cost, :content, :flow).merge(user_id: current_user.id)
  end

end
