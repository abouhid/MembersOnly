class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: "Post created successfully."
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end
end
