class ProductsController < AdminController
  before_action :set_admin_product, only: [:show, :edit, :update, :destroy]

  # GET /admin/products
  def index
    @admin_products = Product.all
  end

  # GET /admin/products/1
  def show
  end

  # GET /admin/products/new
  def new
    @admin_product = Product.new
  end

  # GET /admin/products/1/edit
  def edit
  end

  # POST /admin/products
  def create
    @admin_product = Product.new(admin_product_params)

    if @admin_product.save
      redirect_to @admin_product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/products/1
  def update
    if @admin_product.update(admin_product_params)
      redirect_to @admin_product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/products/1
  def destroy
    @admin_product.destroy
    redirect_to admin_products_url, notice: 'Product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_product
      @admin_product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_product_params
      params.require(:admin_product).permit(:name, :category_id, :description, :price, :quantity, :aggregate_rating)
    end
end
