class ReviewsController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :create, :show, :update, :destroy]

  def show
  	@review = Review.find(params[:id])
  end


  def create
    load_product
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
    @review = Review.find(params[:id])
    session[:return_to] ||= request.referer
  end

  def update
    @review = Review.find(params[:id])

    if @review.update_attributes(params[:review])
      redirect_to session[:return_to]
    else 
      render 'new'
    end
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
