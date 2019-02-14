class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash[:error] = 'Por favor revisar form'
      render :new #the page doesn't reload and the info doesn't get lost
      # redirect_to new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)

    redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :text, :likes, :comments)
  end
end
