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
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Tweet was successfully created.' }
      else
        format.html { render :new }
      end
    end

  end
  private
  def post_params
    params.require(:post).permit(:body)
  end

end
