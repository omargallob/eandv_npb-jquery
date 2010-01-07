class Admin::MetatagController < Admin::BaseController
  def index
    @pages = Page.find(:all)
    @services = Category.find_main
    @properties = Property.find(:all)
  end
  
  def new
		case params[:type]
			when "page"
   			@page = Page.find_by_name(params[:name])
			when "service"
   			@service = Category.find_by_name(params[:name])
			when "property"
   			@property = Property.find_by_id(params[:name])
		end
  end
  
  def create
     @meta = Metatag.new(params[:metatag])
   
     respond_to do |format|
       if @meta.save
         flash[:notice] = 'Metatag was successfully added to page #{@meta.page.name}.'
         format.html { redirect_to(admin_metatag_index_path) }
       else
         format.html { render :action => "new" }
       end
     end
  end
  
  def edit
    @meta = Metatag.find_by_id(params[:id])
  end
  
  def update
    @meta = Metatag.find(params[:id])

     respond_to do |format|
       if @meta.update_attributes(params[:metatag])
         flash[:notice] = 'Page was successfully updated.'
         format.html { redirect_to(admin_metatag_index_path) }
       else
         format.html { render :action => "edit" }
       end
     end
  end
    
  def show
    @meta = Metatag.find_by_id(params[:id])
  end
end
