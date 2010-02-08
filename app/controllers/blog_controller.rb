class BlogController < ApplicationController
  def index
	 @page = Page.find_by_name('blog')
   @posts = Post.find(:all)
  end

  def show
 		@page = Page.find_by_name('blog')
	  @post = Post.find_by_title(params[:id])
  end

end
