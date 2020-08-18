class ReviewsController < ApplicationController
  def index
  end
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to facility_path(@review.facility)
    else
      @facility = Facility.find(params[:id])
      render "facilities/show"
    end
  end
  private
  def review_params
    params.require(:review).permit(:facility_id,
                                  :content,
                                  :free_weight)
  end
end
