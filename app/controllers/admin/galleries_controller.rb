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
    @gallery = Gallery.find_by_id(params[:id])
		@property = @gallery.property
	  if @gallery.update_attributes(params[:gallery])
       respond_to do |format|
         if @property.featured
				   	if @property.featured_gallery.nil?
				      flash[:notice] = '<h1> step2 & 3 are complete!!!</h1><h2>Property is 100% complete</h2>'
							format.html { redirect_to(admin_property_path(@property)) }
						else
				      flash[:notice] = '<h1 >steps 1 & 2 are complete!!!</h1><h2>however the featured image for the home gallery hasnt been uploaded</h2>'
							format.html { redirect_to(:controller => "featured",:action=>"new",:property_id=>@property ) }
										
						end
					else
        	if @property.property_thumbnail.nil?
				      flash[:notice] = '<h1 >steps 1 & 2 are complete!!!</h1><h2>Your missing the thumb for the property listing page - click on the media tab</h2>'
							format.html { redirect_to(edit_admin_property_path(@property)) }
						else
				      flash[:notice] = '<h1 >steps 1, 2 & 3 are complete!!!</h1><h2>Property is 100% complete </h2>'
							format.html { redirect_to(admin_property_path(@property)) }
						end    
					end
				end	
   
    else
      render :action => "edit"
    end
     
  end
  
  def destroy
    @gallery = Gallery.find_by_id(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to(:controller => "galleries",:action=>"new",:property_id=>@gallery.property.id) }
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
