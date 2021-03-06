class ReviewsController < ApplicationController

def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    @user = User.first
    @user.reviews << @review
    
    if @review.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

private
  def review_params
    params.require(:review).permit(:rating, :content)
  end
end