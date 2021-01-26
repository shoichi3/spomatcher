class ReviewsController < ApplicationController
  before_action :set_user
  before_action :set_reviewee

  def index
    @reviewee = User.find(params[:user_id])
    @reviews = Review.where(reviewee_id: @reviewee.id).includes(:reviewer).order('reviews.created_at DESC')
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.reviewer_id = current_user.id
    if @review.save
      redirect_to user_reviews_path(@review.reviewee_id)
    else
      render :new
    end
  end

  private
  
  def set_user
    @user = User.find_by(id: current_user.id)
  end

  def set_reviewee
    @reviewee = User.find(params[:user_id])
  end

  def review_params
    params.require(:review).permit(:score, :content, :reviewee_id)
  end
end
