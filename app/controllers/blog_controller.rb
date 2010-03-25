class BlogController < ApplicationController
  def index
	 @page = Page.find_by_name('blog')

		@subpages = @page.subpages 
	  @posts = Post.find_all_sub
		@posts =	@posts.paginate :page => params[:page], :per_page => 5     
    @categories = Post.find_main
    #@subcats = Post.find_all_sub

   set_meta_tags :title =>  "Blog "

  end

  def show
 		@page = Page.find_by_name('blog')
		@subpages = @page.subpages 
		if params[:parent] == nil
	  @post = Post.find_by_name(params[:id])
		@subposts = @post.subposts.find(:all, :order => "date DESC")
		@subposts =	@subposts.paginate :page => params[:page], :per_page => 5    
		else
	  @post = Post.find_by_name(params[:name])
		end
		@parent = Post.find_by_name(params[:parent])

	  @categories = Post.find_main
	  set_meta_tags :title =>  "Blog | " + @post.title

  end


end
