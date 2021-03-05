class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :search]

  def new
    @user = User.find_by(id: current_user.id)
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
    if user_signed_in?
      @user = User.find_by(id: current_user.id)
      @currentUserRoom = RoomUser.where(user_id: @user.id)
      @post = Post.find(params[:id])
      @postUser = @post.user
      @postUserRoom = RoomUser.where(user_id: @postUser.id)
      @currentUserRoom.each do |cu|
        @postUserRoom.each do |po|
          if cu.room_id == po.room_id
            @haveRoom = true
            @roomId = cu.room_id
          end
        end
      end
      @room = Room.new unless @haveRoom
    end
    @post = Post.find(params[:id])
    @postUser = @post.user
  end

  def edit
    @post = Post.find(params[:id])
    @user = User.find_by(id: current_user.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @user = User.find_by(id: current_user.id)
    if @post.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def update
    @post = Post.find(params[:id])
    @user = User.find_by(id: current_user.id)
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def search
    @user = User.find_by(id: current_user.id) if user_signed_in?
    @posts = Post.search(params[:keyword]).page(params[:page]).per(5).order(created_at: 'DESC')
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :tag_list, :sports, :datetime, :regular_date, :address, :cost, :content,
                                 :flow).merge(user_id: current_user.id)
  end
end
