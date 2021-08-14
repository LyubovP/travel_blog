class HomeController < ApplicationController
  def index
    @blogs = Blog.order("created_at DESC")
  end
end
