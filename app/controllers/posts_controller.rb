class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  def index
    @posts = Post.all
  end

  def show
    # @post = current_user.posts.find(params[:id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
    redirect_to root_url
    
    else
     render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    
    @post.destroy
    redirect_to root_url
  end


  private
  
  def post_params
    params.require(:post).permit(:title, :content)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
end