class Admin::PageAboutController < Admin::BaseController
  def show
    @page = Page.find_by_id(params[:id])
  end
  
  def new
    @page = Page.find_by_id(params[:page_id])
  end
  
  def create
    @page_about = PageAbout.new(params[:page_about])
    
    respond_to do |format|
      if @page_about.save
      
        format.html { 
          if params[:page_about][:photo].blank?
            flash[:notice] = 'Property Thumbnail was successfully created.'
            redirect_to(admin_page_about_path) 
          else
            render :action => "crop"
          end
        }
        format.xml  { render :xml => @page_about, :status => :created, :location => @page_about }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page_about.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @page_about = PageAbout.find_by_id(params[:id])
  end
  
  def update
    @page_about = PageAbout.find_by_id(params[:id])

       respond_to do |format|
         if @page_about.update_attributes params[:page_about]

           format.html {
              if params[:page_about][:photo].blank?         
                  flash[:notice] = 'Category was successfully updated.'
                
                    redirect_to(admin_page_path(@page_about.page))
                
               else
                 render :action => "crop"
               end
             }
           format.xml  { head :ok }
         else
           format.html { render :action => "edit" }
           format.xml  { render :xml => @page_about.errors, :status => :unprocessable_entity }
         end
       end
  end

  def crop
  end
end
