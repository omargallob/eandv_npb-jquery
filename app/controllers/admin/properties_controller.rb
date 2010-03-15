class Admin::PropertiesController < Admin::BaseController
  def index
    @locations = Location.find(:all)
    @properties = Property.find(:all, :include => 'location',:order => 'locations.region')
     respond_to do |format|
         format.html # show.html.erb
         format.atom 
       end
  end

  def show
    @property = Property.find_by_id(params[:id])
    respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @property }
     end
  end

  def new
    @locations = Location.find(:all)
    @property = Property.new
  end

  def create
     @property = Property.new(params[:property])
     @property.facility_ids = @property.facility_ids.split('-')

      respond_to do |format|
        if @property.save
					
          flash[:notice] = '<h1 >step1 complete!!!</h1> Created new property in  :'+@property.location.region+ " - ("+@property.location.state=")<h2>Now you will add the gallery</h2>"
          format.html { redirect_to :controller => "galleries",:action=>"new",:property_id=>@property  }
        else
          format.html { render :action => "new" }
        end
      end
  end

  def edit
    @property = Property.find_by_id(params[:id])
    @gallery = @property.gallery
  end
  
  def update
    @property = Property.find(params[:id])
  
      respond_to do |format|
        if @property.update_attributes(params[:property])
					
      		if @property.gallery.nil?
          flash[:notice] = '<h1>step1 complete!!!</h1><h2>Now you will add the gallery</h2>'
					format.html {  redirect_to :controller => "galleries",:action=>"new",:property_id=>@property }
					else
						if @property.property_thumbnail.nil?
				      flash[:notice] = '<h1 >steps 1 & 2 are complete!!!</h1><h2>Your missing the thumb for the property listing page - click on the media tab</h2>'
							format.html { redirect_to(edit_admin_property_path(@property)) }
						else
				      if @property.featured
									if @property.featured_gallery.nil?
										flash[:notice] = '<h1> steps 1 2 & 3 are complete!!!</h1><h2>however the featured image for the home gallery hasnt been uploaded</h2>'
										   format.html { redirect_to :controller => "featured",:action=>"new",:property_id=>@property }
									else
										flash[:notice] = '<h1 >steps 1, 2, 3 & 4 are complete!!!</h1><h2>Property is 100% complete</h2>'
										@property.validated = true
										@property.save!
										  format.html { redirect_to(admin_property_path(@property)) }
	
									end
							end
						end      
       							flash[:notice] = '<h1 >steps 1, 2 & 3 are complete!!!</h1><h2>Property is 100% complete</h2>'
										@property.validated = true
										@property.save!
									  format.html { redirect_to(admin_property_path(@property)) }
					end
          
         
        else
          format.html { render :action => "edit" }
         
        end
      end
  end
  
  def destroy
    @property = Property.find(params[:id])
    @property.destroy

    respond_to do |format|
      flash[:notice] = 'Deleted property with id:'+@property.id.to_s
      format.html { redirect_to(admin_properties_path) }
      format.xml  { head :ok }
    end
  end
  
  
   def save_featured_photo
     @featured_photo = FeaturedPhoto.new(params[:featured_photo])
       if @featured_photo.save
         flash[:notice] = 'Attachment was successfully created.'
         redirect_to attachable_url(@page_featured_photo)     
       else
         render :action => :new
       end
   end

   def update_featured_photo
     @featured_photo = FeaturedPhoto.new(params[:featured_photo])

       if @featured_photo.save
         flash[:notice] = 'Attachment was successfully created.'
         redirect_to admin_properties_path     
       else
         render :action => :edit
       end
   end
   
   

end
