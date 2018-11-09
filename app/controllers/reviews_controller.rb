class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @product = Product.find_by(id: params[:product_id])
    @review.product = @product

    if @review.save
      redirect_to "/products/#{@product.id}#reviews"
    else
      render "/products/#{@product.id}"
    end
  end

  def destroy
    @product = Product.find_by(id: params[:product_id])
    @review = @product.reviews.find(params[:id])

    @review.destroy
    redirect_to "/products/#{@product.id}#reviews"
  end

  private
    def review_params
      params.require(:review).permit(
        :rating,
        :description,
        :product_id
      )
    end
end
