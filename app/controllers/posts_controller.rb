class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like]

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post.ask_why, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit;end

  def destroy
    @post.destroy
    redirect_to user_posts_posts_path, notice: 'Post was successfully destroyed.'
  end

  def index
    @posts = Post.all
  end

  def like
    if @post.likes.include?(current_user.id.to_s)
      @post.likes.delete current_user.id.to_s
    else
      @post.likes.push current_user.id.to_s
    end
    @post.save
  end

  def new
    @post = Post.new
  end

  def show;end

  def update
    if @post.update(post_params)
      redirect_to @post.ask_why, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def user_posts
    @posts = current_user.posts
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content,:image,:video,:ask_why_id)
    end
end