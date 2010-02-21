class Admin::FeaturedController <  Admin::BaseController
	
  def index
		@property = Property.find_by_id(params[:property_id])
  end

  def show
		@property = Property.find_by_id(params[:property_id])
	  @gallery = FeaturedGallery.find_by_id(params[:id])
    @uploads = @gallery.featured_uploads.find(:all)
		render :layout =>false
  end

  def new
    @property = Property.find_by_id(params[:property_id])
    @gallery = FeaturedGallery.new
	  #@uploads = @gallery.featured_uploads.find(:all)

  end

	def create
	 @gallery = FeaturedGallery.new params[:featured_gallery]
	@property = @gallery.property
       if @gallery.save
         flash[:notice] = 'gallery was successfully created.'
         redirect_to admin_featured_path(@gallery)
       else
         render :action => "new"
       end
	end

end
