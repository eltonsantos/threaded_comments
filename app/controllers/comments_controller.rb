class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  before_action :find_commentable

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @commentable.comments.new(comment_params)

    if @comment.save
      redirect_back(fallback_location: root_path, notice: "Your comment was successfully posted!")
    else
      redirect_back(fallback_location: root_path, notice: "Your comment wasn't posted!")
    end
    # respond_to do |format|
    #   if @comment.save
    #     format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
    #     format.json { render :show, status: :created, location: @comment }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @comment.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_commentable
      # If comment in post or if comment in comment
      @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    end
end
