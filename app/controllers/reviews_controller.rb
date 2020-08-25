class ReviewsController < ApplicationController

  def create
    @facility = Facility.find(params[:facility_id])
    @review = @facility.reviews.build(review_params)
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        flash.now[:notice] = 'コメントが投稿されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの投稿に失敗しました'
        format.js { render :index }
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
