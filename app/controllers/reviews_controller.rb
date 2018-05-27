class ReviewsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to :back, notice: ''
    else
      redirect_to :back, notice: 'review machine broke'
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to :back, notice: 'review deleted'
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end
end
