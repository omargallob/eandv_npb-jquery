class BlogController < ApplicationController
  def index
	 @page = Page.find_by_name('blog')
   @posts = Post.find(:all)

   set_meta_tags :title =>  "Blog "

  end

  def show
 		@page = Page.find_by_name('blog')
	  @post = Post.find_by_title(params[:id])
	  set_meta_tags :title =>  "Blog | " + @post.title
  end

end
