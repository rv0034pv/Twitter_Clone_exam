class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if params[:back]
      render :new
    else
     if @post.save
       redirect_to posts_path, notice: "ツイートに成功しました！"
     else
       render :new
     end
   end
  end

  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "tweetを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"tweetを削除しました！"
  end

  def index
    @posts = Post.all
  end

  def show
  @mytweet = Post.find(params[:id])
  end

  def top
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
