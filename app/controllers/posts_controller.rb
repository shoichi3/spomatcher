class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :search]
  before_action :set_current_user, except: [:create, :show]
  before_action :set_post, except: [:new, :create, :search]
  before_action :set_post_user, only: :show

  def new
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
  end

  def edit
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def update
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

  def set_current_user
    @user = User.find_by(id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_post_user
    @post_user = @post.user
  end
end
