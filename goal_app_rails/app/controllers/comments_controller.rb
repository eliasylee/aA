class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to "#{@comment.commentable_type}_url/#{@comment.commentable_id}"
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end


  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.udpate(comment_params)
      redirect_to "#{@comment.commentable_type}_url/#{@comment.commentable_id}"
    else
      flash.now[:errors] = ["Invalid paramaters"]
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to "#{@comment.commentable_type}_url/#{@comment.commentable_id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
