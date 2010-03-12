class Admin::PostsController < Admin::BaseController
  def index
		@posts = Post.find_main
  end

  def new
		@post = Post.new
  end
	
	def create
    @post = Post.new(params[:post])

      if @post.save
          if params[:post][:photo].blank?
         		flash[:notice] = 'post was successfully updated.'
               redirect_to( admin_posts_path) 
          else
            render :action => "crop"
          end
      else
        render :action => "new"
      end
    
	end

  def edit
	 @post = Post.find_by_id(params[:id])
  end

	def update
			      @post = Post.find_by_id(params[:id])
       respond_to do |format|
         if @post.update_attributes(params[:post])
           format.html { 
             if params[:post][:photo].blank?
         		flash[:notice] = 'post was successfully updated.'
               redirect_to( admin_posts_path) 
          else
            render :action => "crop"
          end
               
            
            }
           format.xml  { head :ok }
         else
           format.html { render :action => "edit" }
           format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
         end
       end
	end

  def show
	 @parent = Post.find_by_id(params[:id])
   @posts = @parent.subposts
      #@subcategories = @category.subcategories
     
  end

	def destroy

	 @post = Post.find_by_id(params[:id])
	 @post.destroy

	 respond_to do |format|
		 format.html { redirect_to(admin_posts_path) }
		 format.xml  { head :ok }
	 end
	end
end
