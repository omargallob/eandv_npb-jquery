class Admin::CommentsController < Admin::BaseController
	def index
		@post = Post.find_by_id(params[:post_id])
	end


  def show
		@post = Post.find_by_id(params[:id])
  end

  def new
  end

  def create
	@comment = Comment.new(params[:comment])
		if @comment.save
			redirect_to view_blog_parent_path(@comment.post.parent.name,@comment.post.name )
		end
  end

  def destroy
      @comment = Comment.find(params[:id])
       @comment.destroy

       respond_to do |format|
         format.html { redirect_to(view_blog_parent_path(@comment.post.parent.name,@comment.post.name )) }
         format.xml  { head :ok }
       end
  end

end
