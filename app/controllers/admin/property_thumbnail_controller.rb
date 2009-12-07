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
            render :action => "crop"
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

       respond_to do |format|
         if @property_thumbnail.update_attributes params[:property_thumbnail]

           format.html {
              if params[:property_thumbnail][:photo].blank?         
                  flash[:notice] = 'Category was successfully updated.'
                
                    redirect_to(edit_admin_property_path(@property_thumbnail.property))
                
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
