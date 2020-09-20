class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: [:edit, :update, :destroy]

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    respond_to do |format|
      if @review.save
        @product.calculate_rating
        format.json { render json: review_serializer, status: :created }
      else
        format.json { render json: @review.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:content, :rating)
    end

    def review_serializer
      {
        id: @review.id,
        content: @review.content,
        rating: @review.rating,
        user: {
          email: @review.user.email
        },
        product: {
          aggregate_rating: @product.reload.aggregate_rating
        },
        comment_form: render_to_string(
          partial: 'comments/form',
          locals: { review: @review, comment: Comment.new }
        )
      }
    end
end
