class Admin::PostGalleryController <  Admin::BaseController
  def index
  end

 def show
    @gallery = PostGallery.find_by_id(params[:id])
    @uploads = @gallery.post_uploads.find(:all)
    # @property -@gallery.property
  end

  def new
  	@post = Post.find_by_id(params[:post_id])
    @gallery = PostGallery.new
  end

	def create
		@gallery = PostGallery.new params[:post_gallery]
			   @post = @gallery.post
       if @gallery.save

         flash[:notice] = 'gallery was successfully created.'
         redirect_to admin_post_gallery_path(@gallery)
       else
         render :action => "new"
       end
	end
  def destroy
    @gallery = PostGallery.find_by_id(params[:id])
		if @gallery
			for u in @gallery.post_uploads
					u.destroy
			 end
		else
			@gallery.destroy
		end   


    respond_to do |format|
      format.html { redirect_to(:controller => "post_gallery",:action=>"show",:id=>@gallery.id || @gallery.featured_gallery.id) }
      format.xml  { head :ok }
    end
  end

end
