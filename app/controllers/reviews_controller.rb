class ReviewsController < ApplicationController
  before_action :set_user
  before_action :set_reviewee

  def index
    @reviewee = User.find(params[:user_id])
  end

  def new
    @review = Review.new
  end

  private
  
  def set_user
    @user = User.find_by(id: current_user.id)
  end

  def set_reviewee
    @reviewee = User.find(params[:user_id])
  end
end
