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
       @list = Country.find(:all)
		
		for c in @list
			@locations = c.locations
			@locations.delete_if{|s| s.properties.size == 0}
		end
		@list.delete_if{|z| z.locations.size == 0}
	
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

	def featured
    @featured = Property.find(:all, :conditions => ['featured = ?', true],:include => 'location',:order => 'locations.region')
      respond_to do |format|
          format.xml  #{ render :xml => @properties }
      end
	end
end
