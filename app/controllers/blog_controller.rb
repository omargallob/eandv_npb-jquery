class BlogController < ApplicationController
  def index
	 @page = Page.find_by_name('blog')

		@subpages = @page.subpages 
	  @posts = Post.find_all_sub
    @categories = Post.find_main
    #@subcats = Post.find_all_sub

   set_meta_tags :title =>  "Blog "

  end

  def show
 		@page = Page.find_by_name('blog')
		@subpages = @page.subpages 
	  @post = Post.find_by_name(params[:id])
		@subposts = @post.subposts
	  @categories = Post.find_main
	  set_meta_tags :title =>  "Blog | " + @post.title
  end

end
