class Admin::GalleriesController <  Admin::BaseController
  def index
  end

  def show
    @gallery = Gallery.find_by_id(params[:id])
    @uploads = @gallery.uploads.find(:all,:order => "position")
    # @property -@gallery.property
  end

  def new
    @property = Property.find_by_id(params[:property_id])
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new params[:gallery]
       if @gallery.save
				@property = @gallery.property			
					if @property.property_thumbnail.nil?
				    flash[:notice] = '<h1 >steps 1 & 2 are complete!!!</h1><h2>Your missing the thumb for the property listing page - click on the media tab</h2>'
						redirect_to(edit_admin_property_path(@property))
					else
				    flash[:notice] = '<h1 >steps 1, 2 & 3 are complete!!!</h1><h2>Property is 100% complete </h2>'
						@property.validated = true
						@property.save!
						redirect_to(admin_property_path(@property)) 
					end       
       else
         render :action => "new"
       end
  
  end
  
  def edit
    @gallery = Gallery.find_by_id(params[:id])
  end
  
   def update
    @upload = Upload.find_by_id(params[:id])
      if @upload.update_attributes(params[:upload])
        if params[:upload][:photo].blank?
					flash[:notice] = 'Upload was successfully updated.' 
	        redirect_to admin_gallery_path(@upload.gallery)
        else
            render :action => "crop"
         end

      else
	        redirect_to admin_gallery_path(@upload.gallery)
      end
  end
  
  def destroy
    @gallery = Gallery.find_by_id(params[:id])
   for u in @gallery.uploads
			u.destroy
	 end

    respond_to do |format|
      format.html { redirect_to(admin_gallery_path(@gallery)) }
      format.xml  { head :ok }
    end
  end
  
  def prioritize_uploads
    gallery = Gallery.find(params[:id])
    uploads = gallery.uploads
    uploads.each do |upload|
      upload.position = params['image'].index(upload.id.to_s) + 1
      upload.save
    end
    render :nothing => true
  end
end
