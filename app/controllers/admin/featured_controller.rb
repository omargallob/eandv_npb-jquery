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
       respond_to do |format|
         if @gallery.update_attributes(params[:featured_gallery])
          flash[:notice] = 'FeaturedGallery was successfully UPDATED.'
          format.html {
               flash[:notice] = 'gallery was successfully updated.'
               redirect_to(admin_featured_path(@gallery))
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
