class PostsController < ApplicationController

  def new
    if user_signed_in?
      @user = User.find_by(id: current_user.id)
    else
      redirect_to new_user_registration_path
    end
    @post = Post.new
  end

end
