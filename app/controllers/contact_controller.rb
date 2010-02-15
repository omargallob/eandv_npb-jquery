class ContactController < ApplicationController
layout "lightbox"

  def index
		@interested_in = ["Buying","Selling"]
		@property_types = Property.find(:all, :include => :type).map{|x| [x.type.title,x.type.id] }
		#@countries = Country.find(:all).map.{|y| [y.id,y.title]}
		@countries = Country.find(:all).map{|y| [ y.title, y.id]}
		#@states = Location.find(:all).map{|z| [z.state]}
		@states = Property.find(:all, :include => :location).map{|w| w.location.state}
		@cities = Property.find(:all, :include => :location).map{|w| w.location.region}
  end

  def neighbourhood
    render :layout => "external"
  end
  
  def mortgage
    @property = Property.find_by_id(params[:id])
    
    @property_tax = @property.price * 0.05
    if @property_tax > 100000
      @property_tax = 100000
    end 
  end 
  
  def plugoo
    render :layout => false
  end
  
  def social
    render :layout => false
  end
  
end
