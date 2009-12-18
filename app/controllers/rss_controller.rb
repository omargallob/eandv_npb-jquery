class RssController < ApplicationController
  def index
      
  end

  def favs
     @favs = Page.find(:all, :conditions=>['featured=?',true])
      respond_to do |format|
          format.xml  #{ render :xml => @properties }
      end
  end

  def properties
      @properties = Property.find(:all, :include => 'location',:order => 'locations.region')
      respond_to do |format|
          format.xml  #{ render :xml => @properties }
      end
  end
  
  def about
       @list = Page.find(:all, :conditions=>['parent_id=?',10])
        respond_to do |format|
            format.xml  #{ render :xml => @properties }
        end
  end
  
  def partners
      @partners = Partner.find(:all)
      respond_to do |format|
          format.xml  #{ render :xml => @properties }
      end
  end

	def similar
		pickup_properties(156)
      respond_to do |format|
          format.xml  #{ render :xml => @properties }
      end
	end	
end
