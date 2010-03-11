class Admin::PropertyThumbnailController < Admin::BaseController
  
  def index
    @property = Property.find_by_id(params[:property_id])
    render :layout => false
  end
  
  def new
    @property = Property.find_by_id(params[:property_id])
  end
  
  def create
    @property_thumbnail = PropertyThumbnail.new(params[:property_thumbnail])
    
    respond_to do |format|
      if @property_thumbnail.save
      
        format.html { 
          if params[:property_thumbnail][:photo].blank?
            flash[:notice] = 'Property Thumbnail was successfully created.'
            redirect_to(admin_property_thumbnail_path) 
          else
            redirect_to :action => "edit"
          end
        }
        format.xml  { render :xml => @property_thumbnail, :status => :created, :location => @property_thumbnail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @property_thumbnail.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def edit
    @property = Property.find_by_id(params[:property_id])
  end
  
  def update
      @property_thumbnail = PropertyThumbnail.find(params[:id])
			@property = @property_thumbnail.property
       respond_to do |format|
         if @property_thumbnail.update_attributes params[:property_thumbnail]

           format.html {
              if params[:property_thumbnail][:photo].blank?         
								if @property.featured
									if @property.featured_gallery.nil?
										flash[:notice] = '<h1> steps 1 2 & 3 are complete!!!</h1><h2>however the featured image for the home gallery hasnt been uploaded</h2>'
										 redirect_to :controller => "featured",:action=>"new",:property_id=>@property 
									else
										flash[:notice] = '<h1 >steps 1, 2, 3 & 4 are complete!!!</h1><h2>Property is 100% complete</h2>'
										redirect_to(edit_admin_property_path(@property)) 
	
									end
								else
									if @property.gallery.nil?
									flash[:notice] = '<h1 >steps 1 & 2 are complete!!!</h1><h2>Your missing the gallery for the property listing page you are being redirected</h2>'
									 redirect_to :controller => "gallery",:action=>"new",:property_id=>@property 
									else
									flash[:notice] = '<h1 >steps 1, 2 & 3 are complete!!!</h1><h2>Property is 100% complete </h2>'
									redirect_to(admin_property_path(@property))
									end    
									
								end	
                
               else
                 render :action => "crop"
               end
             }
           format.xml  { head :ok }
         else
           format.html { render :action => "edit" }
           format.xml  { render :xml => @property_thumbnail.errors, :status => :unprocessable_entity }
         end
       end
  end

  def crop
  end 
  
  def destroy
    @propertythumb = PropertyThumbnail.find_by_id(params[:id])
    @propertythumb.destroy

    respond_to do |format|
      flash[:notice] = 'Deleted property thumb with id:'+@propertythumb.id.to_s
      format.html { redirect_to(edit_admin_property_path(@propertythumb.property)) }
      format.xml  { head :ok }
    end
  end
end
