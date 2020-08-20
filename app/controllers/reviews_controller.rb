class ReviewsController < ApplicationController

  def create
    @facility = Facility.find(params[:facility_id])
    @review = @facility.reviews.build(review_params)
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        format.js { render :index }
      else
        format.html { redirect_to facility_path(@facility), notice: '投稿できませんでした...' }
      end
    end
  end

  private
  def review_params
    params.require(:review).permit(:facility_id,
                                  :content,
                                  :free_weight,
                                  :machine,
                                  :caedio
                                )
  end
end
