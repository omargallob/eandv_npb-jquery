class PropertiesController < ApplicationController
  def index

     @properties = Property.find(:all, :include => 'location',:order => 'locations.region')
     @page = Page.find_by_name('properties')
      if @page.metatag
         set_meta_tags :title =>  @page.title,
                     :description => @page.metatag.description,
                     :keywords =>  @page.metatag.keywords 
       else
         set_meta_tags :title =>  @page.title
      end
     @subpages = @page.subpages
      respond_to do |format|
          format.html # show.html.erb
          format.xml  #{ render :xml => @properties }
        end
  end

  def show

    @property = Property.find_by_id(params[:id])
    @page = Page.find_by_name('properties')
  @subpages = @page.subpages
       set_meta_tags :title =>  "("+@property.location.zipcod+") "+@property.location.region+" - "+ @property.title

  end 
  
  def feed
    @favs = Page.find(:all, :conditions=>['featured=?',true])
    respond_to do |format|
        format.xml  #{ render :xml => @properties }
    end
  end

end
