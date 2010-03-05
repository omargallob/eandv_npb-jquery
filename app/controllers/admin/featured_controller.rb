class Admin::FeaturedController <  Admin::BaseController

	def index
  end
  def show
    @gallery = FeaturedGallery.find_by_id(params[:id])
    @uploads = @gallery.featured_uploads.find(:all,:order => "position")
    # @property -@gallery.property
  end

  def new
    @property = Property.find_by_id(params[:property_id])
    @gallery = FeaturedGallery.new
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

  def edit
    @gallery = FeaturedGallery.find_by_id(params[:id])
  end
  
  def update
    @gallery = FeaturedGallery.find_by_id(params[:id])
		@property = @gallery.property
       respond_to do |format|
         if @gallery.update_attributes(params[:featured_gallery])
         
          format.html {
              if @property.gallery.nil?
									flash[:notice] = '<h1 >steps 1 & 2 are complete!!!</h1><h2>Your missing the gallery for the property listing page you are being redirected</h2>'
									 redirect_to :controller => "gallery",:action=>"new",:property_id=>@property 
									else
									flash[:notice] = '<h1 >steps 1, 2 & 3 are complete!!!</h1><h2>Property is 100% complete </h2>'
									redirect_to(admin_property_path(@property))
									end    
          }
        else
          render :action => "edit"
        end
      end
  end

  def destroy
    @gallery = FeaturedGallery.find_by_id(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to(:controller => "featured",:action=>"new",:property_id=>@gallery.property.id) }
      format.xml  { head :ok }
    end
  end

  def prioritize_uploads
    gallery = FeaturedGallery.find(params[:id])
    uploads = gallery.featured_uploads.find(:all,:order => "position")
    uploads.each do |upload|
      upload.position = params['image'].index(upload.id.to_s) + 1
      upload.save
    end
    render :nothing => true
  end

end
