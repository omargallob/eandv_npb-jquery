class Admin::GooglemapController < Admin::BaseController

  include Geokit::Geocoders


  def index
  end
  
  def show
    @property = Property.find_by_id(params[:id])
    string =  @property.address
    
     @res=GoogleGeocoder.geocode(string)    
     if @res.success
       @lng = @res.lng
       @lat = @res.lat
     end
    
     @map = GMap.new("map")
     @map.control_init(:large_map => true,:map_type => true)
     @map.center_zoom_init([@lat,@lng],14)
  end
  
  def create
  end
  
  def update
  end
  
end
