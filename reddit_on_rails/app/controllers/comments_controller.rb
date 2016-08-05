class CommentsController < ApplicationController

  before_action :author_redir, only: [:update, :edit, :destroy]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    
    if @comment.save
      redirect_to post_url(@comment.post)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to post_url(@comment.post_id)
    end
  end

  def show
    @cmt = Comment.find(params[:id])
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_url(@comment.post)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_url(@comment.post_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :parent_comment_id)
  end

  def author_redir
    @comment = Comment.find(params[:id])
    redirect_to subs_url unless @comment.user_id == current_user.id
  end
end
