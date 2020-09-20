class ReviewsController < AdminController
  before_action :set_admin_review, only: [:show, :edit, :update, :destroy]

  # GET /admin/reviews
  def index
    @admin_reviews = Review.all
  end

  # GET /admin/reviews/1
  def show
  end

  # GET /admin/reviews/new
  def new
    @admin_review = Review.new
  end

  # GET /admin/reviews/1/edit
  def edit
  end

  # POST /admin/reviews
  def create
    @admin_review = Review.new(admin_review_params)

    if @admin_review.save
      redirect_to @admin_review, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/reviews/1
  def update
    if @admin_review.update(admin_review_params)
      redirect_to @admin_review, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/reviews/1
  def destroy
    @admin_review.destroy
    redirect_to admin_reviews_url, notice: 'Review was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_review
      @admin_review = Review.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_review_params
      params.require(:admin_review).permit(:content, :rating, :user_id, :product_id)
    end
end
