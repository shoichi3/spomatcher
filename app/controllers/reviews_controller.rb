class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_user, except: :index
  before_action :set_reviewee

  def index
    @user = User.find_by(id: current_user.id) if user_signed_in?
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
      @review.create_notification_review!(current_user, @review.reviewee)
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
