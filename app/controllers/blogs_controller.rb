class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @blogs = Blog.all
  end

  def show
    # @blog = current_user.blogs.find(params[:id])
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    @blog = Blog.find(params[:id])
    
    if @blog.update(blog_params)
    redirect_to root_url
    
    else
     render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    
    @blog.destroy
    redirect_to :action => :index
  end


  private
  
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  
  def set_blog
    @blog = Blog.find(params[:id])
  end
end