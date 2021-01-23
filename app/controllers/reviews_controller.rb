class ReviewsController < ApplicationController
  before_action :set_user

  def index
    @user = User.find_by(id: current_user.id)
    @reviewee = User.find(params[:user_id])
  end

  def new
    @user = User.find_by(id: current_user.id)
    @review = Review.new
  end

  private
  
  def set_user
    @user = User.find_by(id: current_user.id)
  end
end
