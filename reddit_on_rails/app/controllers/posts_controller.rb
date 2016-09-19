class PostsController < ApplicationController

    before_action :author_redir, only: [:update, :edit, :destroy]

    def index
      @posts = Post.all
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id

      if @post.save
        redirect_to post_url(@post)
      else
        flash.now[:errors] = @post.errors.full_messages
        render :new
      end
    end

    def show
      @post = Post.find(params[:id])
      @comments_by_parent_id = @post.comments_by_parent_id
    end

    def edit
    end

    def update
      if @post.update(post_params)
        redirect_to post_url(@post)
      else
        flash.now[:errors] = @post.errors.full_messages
        render :edit
      end
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to sub_url(@post.sub_id)
    end

    private

    def post_params
      params.require(:post).permit(:title, :url, :content, sub_ids: [])
    end

    def author_redir
      @post = Post.find(params[:id])
      redirect_to subs_url unless @post.user_id == current_user.id
    end
end
