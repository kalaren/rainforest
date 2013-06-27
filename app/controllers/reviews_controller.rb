class ReviewsController < ApplicationController
	before_filter :load_product, :ensure_logged_in, only: [:edit, :create, :show, :update, :destroy]

  def show
  	@review = Review.find(params[:id])
  end


  def create
  	@review = @product.reviews.build(
      comment: params[:review][:comment],
      user_id: current_user.id
    )

  	if @review.save
  		redirect_to product_path(@product), notice: "Review created successfully"
  	else
  		render action: :show
  	end
  end

  def edit

  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  end

  private

  def load_product
  	@product = Product.find(params[:product_id])
  end

end
