class ContactController < ApplicationController
layout "lightbox"

  def index
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
end
