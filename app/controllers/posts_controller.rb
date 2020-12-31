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

  def edit
    @post = Post.find(params[:id])
    @user = User.find_by(id: current_user.id)
  end

  def destroy
    post = Post.find(params[:id])
    @user = User.find_by(id: current_user.id)
    if post.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def update
    @post = Post.new(post_params)
    @user = User.find_by(id: current_user.id)
    if @post.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :tag_list, :sports, :datetime, :regular_date, :address, :cost, :content, :flow).merge(user_id: current_user.id)
  end

end
