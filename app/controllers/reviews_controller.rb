class ReviewsController < ApplicationController
  def new
    Review.new(:user_id => current_user.id, :show_id => @current_show.id)
  end

  def create
    @review = Review.create(review_params)
    if @review.valid?
      redirect_to show_path(current_show)
    else
      redirect_to show_path(current_show), alert: "Invalid Review"
    end
  end

  def index
  end

  private

  helper_method :current_show
  def current_show
    @current_show ||= Show.find(review_params[:show_id])
  end

  def review_params
    params.require(:review).permit(:user_id, :show_id, :rating, :title, :body)
  end
end
