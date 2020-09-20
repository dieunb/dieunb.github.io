class CommentsController < AdminController
  before_action :set_admin_comment, only: [:show, :edit, :update, :destroy]

  # GET /admin/comments
  def index
    @comments = Comment.all
  end

  # GET /admin/comments/1
  def show
  end

  # GET /admin/comments/new
  def new
    @comment = Comment.new
  end

  # GET /admin/comments/1/edit
  def edit
  end

  # POST /admin/comments
  def create
    @comment = Comment.new(admin_comment_params)

    if @comment.save
      redirect_to admin_comment_path(@comment), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/comments/1
  def update
    if @comment.update(admin_comment_params)
      redirect_to admin_comment_path(@comment), notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/comments/1
  def destroy
    @comment.destroy
    redirect_to admin_comments_url, notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_comment_params
      params.require(:admin_comment).permit(:content, :review_id, :user_id)
    end
end
