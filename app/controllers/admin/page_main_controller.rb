class Admin::PageMainController < Admin::BaseController
layout 'cropper'

  def show
    @page = Page.find_by_id(params[:id])

  end
  
  def new
    @page = Page.find_by_id(params[:page_id])
  end
  
 def create
    @page_main = PageMain.new(params[:page_main])
    
    respond_to do |format|
      if @page_main.save
      
        format.html { 
          if params[:page_main][:photo].blank?
            flash[:notice] = 'Property Thumbnail was successfully created.'
            redirect_to(admin_page_main_path) 
          else
            render :action => "crop"
          end
        }
        format.xml  { render :xml => @page_main, :status => :created, :location => @page_main }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page_main.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
  end

 def update
   @page_main = PageMain.find_by_id(params[:id])

       respond_to do |format|
         if  @page_main.update_attributes params[:page_main]

           format.html {
              if params[:page_main][:photo].blank?         
                  flash[:notice] = 'Category was successfully updated.'
                
                    redirect_to(admin_page_main_path( @page_main.page))
                
               else
                 render :action => "crop"
               end
             }
           format.xml  { head :ok }
         else
           format.html { render :action => "edit" }
           format.xml  { render :xml => @page_main.errors, :status => :unprocessable_entity }
         end
       end
  end

	def destroy
    @page_main = PageMain.find_by_id(params[:id])
    @page_main.destroy

    respond_to do |format|
      flash[:notice] = '<h3>Deleted page main for :<i>'+@page_main.page.name.upcase+'</i></h3>'
      format.html { redirect_to(admin_page_main_path(@page_main.page)) }
      format.xml  { head :ok }
    end
	end

end
