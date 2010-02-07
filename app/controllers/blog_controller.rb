class BlogController < ApplicationController
  def index
	 @page = Page.find_by_name('blog')
   @posts = Post.find(:all)
  end

  def show
  end

end
